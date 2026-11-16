import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onmi_art_central/models/LoginModel.dart';


class AuthController extends GetxController with StateMixin<LoginModel> {
  final emailController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;
  Rx<TextEditingController> phoneController = TextEditingController().obs;
  Rx<TextEditingController> firstNameController = TextEditingController().obs;
  Rx<TextEditingController> lastNameController = TextEditingController().obs;
  Rx<FocusNode> phoneFocusNode = FocusNode().obs;
  Rx<FocusNode> passwordFocusNode = FocusNode().obs;
  Rx<FocusNode> firstNameFocusNode = FocusNode().obs;
  Rx<FocusNode> lastNameFocusNode = FocusNode().obs;
  
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

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // SetUserData? setUserData;
  // final GetStorage box = GetStorage();



  @override
  void onClose() {
    // Dispose of controllers and focus nodes
    phoneController.value.dispose();
    passwordController.value.dispose();
    phoneFocusNode.value.dispose();
    passwordFocusNode.value.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  phoneController=  TextEditingController().obs;; 
  passwordController = TextEditingController().obs;; 
  firstNameController = TextEditingController().obs;; 
  lastNameController = TextEditingController().obs;; 
    // Attach a listener to the focus node
    phoneFocusNode.value.addListener(() {
      isPhoneFocused.value = phoneFocusNode.value.hasFocus;
    });
  }
  
  void clearFields() {
  phoneController.value .text= ''; 
  passwordController.value.text = ''; 
  firstNameController.value.text = ''; 
  lastNameController.value.text = ''; 
  }

 Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      avatarImagePath.value = pickedFile.path;
    }
  }
  Future<void> login() async {
    clearFields();
    // final email = emailController.value.text;
    // final password = passwordController.value.text;
    // try {
    //   isLoading(true).obs;
    //   UserCredential userCredential = await _auth.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //   User? user = userCredential.user!;
    //   if (user.emailVerified) {
    //     await LocalStore.setLoginStatus(true);
    //     Get.to(const StartupPage(),
    //         duration: const Duration(seconds: 1), transition: Transition.zoom);
    //   } else {
    //     errorSnackbar('Verify your email');
    //   }
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'wrong-password') {
    //     print('Error logging in: $e');
    //     errorSnackbar('Wrong Password');
    //   } else if (e.code == 'user-not-found') {
    //     print('Error logging in: $e');
    //     errorSnackbar('The Email does not exist');
    //   } else if (e.code == 'invalid-email') {
    //     print('Error logging in: $e');
    //     errorSnackbar('the email is not valid');
    //   } else {
    //     print('Error logging in: $e');
    //     errorSnackbar('Login failed: $e');
    //   }
    // } catch (e) {
    //   print('Error logging in: $e');
    //   errorSnackbar('Login failed: $e');
    // } finally {
    //   isLoading(false).obs;
    // }
  }

  Future<void> resetPassword() async {
    // try {
    //   isLoading(true).obs;
    //   await _auth.sendPasswordResetEmail(
    //       email: emailController.value.text);
    //   successSnackbar('Password reset email sent. Check your email inbox.');
    // } on FirebaseAuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('Error resetting password: $e');
    //     errorSnackbar('No user found with this email.');
    //   } else {
    //     print('Error resetting password: $e');
    //     errorSnackbar('Failed to reset password: $e');
    //   }
    // } catch (e) {
    //   print('Error resetting password: $e');
    //   errorSnackbar('Failed to reset password: $e');
    // } finally {
    //   isLoading(false).obs;
    // }
  }

  Future<void> handleSignIn(BuildContext context) async {
  //   isLoading(true).obs;
  //   try {
  //     final GoogleSignInAccount? googleSignInAccount =
  //         await _googleSignIn.signIn();
  //     final GoogleSignInAuthentication googleSignInAuthentication =
  //         await googleSignInAccount!.authentication;

  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleSignInAuthentication.accessToken,
  //       idToken: googleSignInAuthentication.idToken,
  //     );
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     User user = userCredential.user!;
  //     String? userName = user.displayName;
  //     print("user$userName");
  //     await LocalStore.saveLoginDetails(
  //         number: user.email!, name: user.displayName!);
  //     await LocalStore.setLoginStatus(true);
  //     isLoading(false).obs;
  //     Get.offAll(const HomeNavbar());
  //   } catch (error) {
  //     print('Error signing in with Google: $error');
  //   } finally {
  //     isLoading(false).obs;
  //   }
  }
}
