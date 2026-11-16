import 'dart:async';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onmi_art_central/models/artist_model.dart';
import 'package:onmi_art_central/models/auth_model/request_register_model.dart';
import 'package:onmi_art_central/models/chat_fielt.dart';
import 'package:onmi_art_central/models/message.dart';
import 'package:onmi_art_central/repositories/artist_repository.dart';
import 'package:onmi_art_central/repositories/auth_repository.dart';
import 'package:onmi_art_central/screens/Home/ai/add_art_ai_based.dart';
import 'package:onmi_art_central/utill/validators.dart';
import 'package:onmi_art_central/utill/snackbar.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:speech_to_text/speech_to_text.dart';

class NavigationController extends GetxController {
  Rx<TextEditingController> title = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<TextEditingController> fullNameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;
  Rx<TextEditingController> confirmPasswordController =
      TextEditingController().obs;
  var role = 'Artist';
  var isVerifiedType = 'email';

  RxDouble xPos = 0.0.obs;
  RxDouble yPos = 300.0.obs;

  final TextEditingController textController = TextEditingController();
  final RxBool isTyping = false.obs;
  final RxBool isListening = false.obs;
  final RxList<Map<String, String>> chatHistory = <Map<String, String>>[].obs;
  final RxString errorMessage = ''.obs;
  int currentQuestionIndex = 0;
  bool get hasMoreQuestions => currentQuestionIndex < questions.length;
  final RxBool optionNo = false.obs;
  final RxBool noButtonBorder = true.obs;
  final AuthRepository _authRepository = Get.find();

  Rx<FocusNode> phoneFocusNode = FocusNode().obs;
  Rx<FocusNode> passwordFocusNode = FocusNode().obs;
  Rx<FocusNode> firstNameFocusNode = FocusNode().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;
  Rx<FocusNode> titleFocusNode = FocusNode().obs;
  Rx<FocusNode> descriptionFocusNode = FocusNode().obs;
  final PanelController spanelController = PanelController();
  final Map<String, TextEditingController> controllers = {};

  var isSwitchOn = false.obs;
  RxBool isNavigated = false.obs;
  RxBool isPhoneFocused = false.obs;
  var avatarImagePath = ''.obs;
  RxBool isCountryCodeFocused = false.obs;
  var isPasswordVisible = false.obs;
  var selectedCountryCode = ''.obs;
  var isPasswordHidden = false.obs;

  var phoneError = ''.obs;
  var firstNameError = ''.obs;
  var lastNameError = ''.obs;
  RxBool isLoading = false.obs;
  var titleError = ''.obs;
  var descriptionError = ''.obs;

  var selectedStep = 0.obs;
  var selectedImages = <String>[].obs;
  var mainImage = Rx<String?>(null);
  var artDescription = ''.obs;
  var artDescriptions = <String>[].obs;
//speach to text
  final SpeechToText _speechToText = SpeechToText();

  final RxInt selectedIndex = 0.obs;
  final RxList<Artist> artists = <Artist>[].obs;
  final Rx<Artist?> selectedArtist = Rx<Artist?>(null);
  final RxBool isCollectionExpanded = false.obs;
  final RxBool isBottomAppBarOpen = false.obs;
  RxList<XFile> pickedImages = <XFile>[].obs;

  final _repository = ArtistRepository();

  late PanelController panelController;

  late final List<ChatField> fields;
  final messages = <Message>[].obs;

  final List<String> homeAppBarTitlesList = [
    'Home',
    'Gallery',
    'Add Art',
    'Messages',
    'Profile',
  ];

  //number should be formated confirm passsword should be same

  @override
  void onClose() {
    title.value.dispose();
    description.value.dispose();
    phoneController.value.dispose();
    passwordController.value.dispose();
    phoneFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    controllers.forEach((key, controller) {
      controller.dispose();
    });
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    panelController = PanelController();
    _loadArtists();
    for (var question in questions) {
      controllers[question] = TextEditingController();
    }
  }

  void openPanel() {
    panelController.open();
  }

  Future<void> _loadArtists() async {
    try {
      final loadedArtists = await _repository.getFeaturedArtists();
      artists.value = loadedArtists;

      if (loadedArtists.isNotEmpty) {
        selectArtist(loadedArtists.first);
      }
    } catch (e) {
      print('Error loading artists: $e');
    }
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }

  void selectArtist(Artist artist) {
    selectedArtist.value = artist;
  }

  void toggleCollectionExpansion() {
    isCollectionExpanded.value = !isCollectionExpanded.value;
  }

  RxString get currentTitle =>
      RxString(homeAppBarTitlesList[selectedIndex.value]);

  Future<void> toggleListening(ChatField field) async {
    if (field.isListening.value) {
      field.isListening.value = false;
      _speechToText.stop();
    } else {
      bool available = await _speechToText.initialize();
      if (available) {
        field.isListening.value = true;
        _speechToText.listen(onResult: (result) {
          field.controller.text = result.recognizedWords;
        });
      }
    }
  }

  Future<void> startListening() async {
    isListening.value = true;
    String spokenText = await getSpeechInput();
    if (spokenText.isNotEmpty) {
      textController.text += spokenText;
      isTyping.value = true;
    }
    isListening.value = false;
  }

  void onSendPressed() {
    if (textController.text.isNotEmpty) {
      updateArtDescription(textController.text.trim());
      addToHistory(textController.text.trim());
      addAnswer(textController.text.trim());

      textController.clear();
      isTyping.value = false;
    }
  }

  void stopListening() {
    isListening.value = false;
    _speechToText.stop();
  }

  void sendMessage(String content) {
    if (content.trim().isEmpty) return;
    messages.add(Message(sender: 'user', content: content));
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        Message(sender: 'bot', content: 'Bot response to "$content"'),
      );
    });
  }

  final List<String> questions = [
    'Can I Sign you up?',
    'Set up your E-mail address',
    'What is your full Name?',
    'Add Your Phone Number.',
    'What country are you from?',
    'Are you an Artist or a Buyer',
    'Set your password',
    'Please confirm your passwoord',
    'Would you like to proceed?',
  ];
  String get currentQuestion => currentQuestionIndex < questions.length
      ? questions[currentQuestionIndex]
      : '';

  void addAnswer(String answer) {
    if (answer.trim().isEmpty) {
      errorMessage.value = 'Answer cannot be empty.';
      return;
    }
    errorMessage.value = '';
    if (hasMoreQuestions) {
      // Save the answer in the corresponding controller
      controllers[currentQuestion]?.text = answer;
      // Add the question-answer pair to the chat history
      chatHistory.add({'question': currentQuestion, 'answer': answer});
      currentQuestionIndex++;
      update();

      if (!hasMoreQuestions) {
        onAllQuestionsCompleted();
      }
    }
  }

  void handleNavigation() {
    if (!hasMoreQuestions) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(
          () => SecondHomeDashboard(),
        );
      });
    }
  }

  void push(BuildContext context) {
    if (questions.isEmpty) {
      Future.delayed(const Duration(seconds: 2), () {
        Get.offAll(() => SecondHomeDashboard());
      });
    }
  }

  // This will hold the chat history (question + answer pairs)
  var botHistory = <Map<String, String>>[].obs;

  // Method to pick images (this is where you integrate the image picker logic)
  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> pickedImages = await picker.pickMultiImage();
      if (pickedImages.isNotEmpty) {
        selectedImages.addAll(pickedImages.map((image) => image.path));
        // Add the first question and answer to the chat history
        botHistory.add({
          "question":
              "Please add all the pictures you want to associate with your work of art?",
          "answer": "Images selected: ${pickedImages.length} images"
        });
        selectedStep.value = 1;
        refresh();
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }

  // Method to set the main image
  void setMainImage(String image) {
    mainImage.value = image;
    // Add the main image question and answer to the chat history
    chatHistory.add({
      "question": "Which picture do you want to use as the main picture?",
      "answer": "Main image selected: $image"
    });
    selectedStep.value = 2;
  }

  void updateArtDescription(String description) {
    artDescriptions.add(description);
    // Add description question and answer to the chat history
    botHistory.add({
      "question": "Please tell me as much as you can about your art?",
      "answer": description
    });
  }

  Future<String> getSpeechInput() async {
    SpeechToText speech = SpeechToText();
    String result = '';

    bool available = await speech.initialize();
    if (available) {
      // Use a Completer to wait for results
      Completer<String> completer = Completer<String>();

      speech.listen(
        onResult: (speechResult) {
          result = speechResult.recognizedWords; // Update the result
          if (!speechResult.finalResult) return; // Wait for final result
          if (!completer.isCompleted) completer.complete(result);
        },
      );
      print('Recognized speech: $result');
      result = await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          speech.stop();
          return '';
        },
      );

      await speech.stop();
    } else {
      print('Speech recognition not available');
    }

    return result;
  }

  void change(DragUpdateDetails details) {
    xPos.value += details.delta.dx;
    yPos.value += details.delta.dy;
  }

  RxBool isExpanded = false.obs;
  void expanding() {
    isExpanded.value = !isExpanded.value;
  }

  RxBool isPanelOpen = false.obs;

  void addToHistory(String text) {
    // botHistory.add(text);
  }
  Future<void> registerUser(Map<String, String> answers) async {
    final fullName = answers['What is your full name?'] ?? '';
    final email = answers['Give me your email address'] ?? '';
    final phoneNumber = answers['Add Your Phone Number.'] ?? '';
    final country = answers['What country are you from?'] ?? '';
    final password = answers['Please enter your password'] ?? '';
    final confirmPassword = answers['Please confirm your passwoord'] ?? '';

    print('here is my fullName $fullName');
    print('email $email');
    print('phoneNumber $phoneNumber');
    print('password $password');
    print('confirmPassword $confirmPassword');

    final nameError = Validator.validateName(fullName);
    final emailError = Validator.validateEmail(email);
    final passwordError = Validator.validatePassword(password);
    final confirmPasswordError =
        Validator.validateConfirmPassword(password, confirmPassword);

    if (nameError != null) {
      SnackbarUtil.showErrorSnackbar('Full Name Error', nameError);
      return;
    }
    if (emailError != null) {
      SnackbarUtil.showErrorSnackbar('Email Error', emailError);
      return;
    }
    if (passwordError != null) {
      SnackbarUtil.showErrorSnackbar('Password Error', passwordError);
      return;
    }
    if (confirmPasswordError != null) {
      SnackbarUtil.showErrorSnackbar(
          'Confirm Password Error', confirmPasswordError);
      return;
    }

    isLoading.value = true;

    try {
      final user = RequestRegisterModel(
        fullName: fullName,
        email: email,
        phoneNumber: phoneNumber,
        country: country,
        role: 'ARTIST',
        verificationType: 'email',
        password: password,
        confirmPassword: confirmPassword,
      );

      await _authRepository.registerUser(user);

      Get.offAll(() => SecondHomeDashboard());
    } catch (e) {
      SnackbarUtil.showErrorSnackbar('Registration Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void onAllQuestionsCompleted() {
    final answers = controllers
        .map((question, controller) => MapEntry(question, controller.text));
    registerUser(answers);
  }
}
