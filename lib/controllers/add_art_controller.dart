import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onmi_art_central/models/artist_model.dart';
import 'package:onmi_art_central/repositories/artist_repository.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:io';

class AddArtController extends GetxController {
  // Existing Controllers
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController shippingAddress = TextEditingController();
  TextEditingController discount = TextEditingController();

  // Existing Observables
  final RxInt selectedIndex = 0.obs;
  final RxList<Artist> artists = <Artist>[].obs;
  final Rx<Artist?> selectedArtist = Rx<Artist?>(null);
  final RxBool isCollectionExpanded = false.obs;
  final RxBool isBottomAppBarOpen = false.obs;
  RxBool isChecked = false.obs;
  RxBool value = true.obs;

  // Repository
  final ArtistRepository _repository = ArtistRepository();

  // Panel Controller
  late PanelController panelController;

  // PageController for PictureView
  final PageController pageController = PageController();

  // Observable for current page index
  final RxInt currentPage = 0.obs;

  // List of Image URLs
  final List<String> ImageUrl = [
    "https://images.unsplash.com/photo-1733175697085-aa500b61ac74?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyNnx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1732740674539-74d1f760acfa?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMnx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1731612812235-dc191e5ff4ad?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxM3x8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1732480509151-cb3d991ff9a2?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwyMHx8fGVufDB8fHx8fA%3D%3D",
  ];

  @override
  // void onInit() {
  //   super.onInit();
  //   panelController = PanelController();
  //   _loadArtists();

  //   // Initialize PageController and listen to page changes
  //   pageController.addListener(_handlePageChange);
  // }

  @override
  // void onClose() {
  //   // Dispose controllers to free resources
  //   titleController.dispose();
  //   descriptionController.dispose();
  //   pageController.dispose();
  //   super.onClose();
  // }

  // Load artists from repository
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

  // Handle page changes in PageView
  void _handlePageChange() {
    final page = pageController.page?.round() ?? 0;
    if (currentPage.value != page) {
      currentPage.value = page;
    }
  }

  // Navigation methods
  void nextPage() {
    if (currentPage.value < ImageUrl.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (currentPage.value > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Existing Methods
  void openPanel() {
    panelController.open();
    // setState(() {}); // Not needed in GetX
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

  RxBool isBorder = false.obs;
  void toggleBorder() {
    isBorder.value = !isBorder.value;
  }

  RxBool isFav = false.obs;
  void toggleFav() {
    isFav.value = !isFav.value;
  }

  var scafColor = const Color(0xfffaedcd).obs; // Default scaffold color

  void changeScaf(Color color) {
    scafColor.value = color;
  }

  late CameraController _cameraController;
  final RxBool _isCameraInitialized = false.obs;
  final RxString _imagePath = ''.obs;

  CameraController get cameraController => _cameraController;
  bool get isCameraInitialized => _isCameraInitialized.value;
  String get imagePath => _imagePath.value;

  @override
  void onInit() {
    super.onInit();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras.first,
      ResolutionPreset.ultraHigh,
    );

    await _cameraController.initialize();
    _isCameraInitialized.value = true;
  }

  @override
  void onClose() {
    _cameraController.dispose();
    super.onClose();
  }
}
