part of 'app_pages.dart';

abstract class Routes {
  static const SPLASH = '/splash';
  // Main App Routes
  static const HOME = '/home';
  static const second_home_dashboard = '/secondhomeDashoabrd';

  static const PROFILE = '/profile';
  static const CHAT = '/chat';
  static const GALLERY = '/gallery';
  static const ADD_POST = '/add-post';

  // Auth Routes
  static const FORGET_PASSWORD = '/forget-password';
  static const SIGN_UP = '/sign-up';
  static const LOGIN_IN = '/login-in';
  static const SELECTIONS_SCREEN = '/selections-screen';

  // Feature Routes
  static const ARTIST_DETAIL = '/artist-detail';
  static const EDIT_PROFILE = '/edit-profile';
  static const SETTINGS = '/settings';
  static const NOTIFICATIONS = '/notifications';

  //collections
  static const COLLECTION_DETAILS = '/collection-details';
  static const ART_DETAILS = '/art-details';
  static const BUYER_ADDRESS = '/buyer-shipping-address';
  static const COLOR_PAGE = '/color_page';
  static const CAMERA_PAGE = '/camera_page';

  //add art
  static const ADD_ART_ONE = '/add-art-screen-one';
  static const ADD_ART_TWO = '/add-art-screen-two';
  static const ADD_ART_THREE = '/add-art-screen-three';

  //video meeting
  static const VIDEO_MEETING = '/video-meeting';
}
