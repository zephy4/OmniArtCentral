import 'package:get/get.dart';
import 'package:onmi_art_central/bindings/home_binding.dart';
import 'package:onmi_art_central/screens/Home/ai/home_auth_ai.dart';
import 'package:onmi_art_central/screens/Home/ai/add_art_ai_based.dart';
import 'package:onmi_art_central/screens/add_art/add_art_one_scree.dart';
import 'package:onmi_art_central/screens/add_art/add_art_step_three_screen.dart';
import 'package:onmi_art_central/screens/add_art/add_art_two_screen.dart';
import 'package:onmi_art_central/screens/art_details/ui/camera_page.dart';
import 'package:onmi_art_central/screens/art_details/ui/colorpage.dart';
import 'package:onmi_art_central/screens/auth/ForgetPassword/forget_password.dart';
import 'package:onmi_art_central/screens/art_details/ui/art_details.dart';
import 'package:onmi_art_central/screens/art_details/ui/buyer_shipping_address.dart';
import 'package:onmi_art_central/screens/auth/login/login_page.dart';
import 'package:onmi_art_central/screens/auth/signup/sign_up.dart';
import 'package:onmi_art_central/screens/messages/chat_screen.dart';
import 'package:onmi_art_central/screens/collections/collection_details.dart';
import 'package:onmi_art_central/screens/profile/profile_screen.dart';
import 'package:onmi_art_central/screens/selections/selection_page_screen.dart';
import 'package:onmi_art_central/screens/startUp/splash_screen.dart';
import 'package:onmi_art_central/screens/video_meeting/video_meeting.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => const HomeNavbar(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.PROFILE,
          page: () => ProfileScreen(isFromEdit: false),
        ),
        GetPage(
          name: Routes.CHAT,
          page: () => ChatScreen(),
          binding: MessageBinding(),
        ),
      ],
    ),
    GetPage(
      name: Routes.FORGET_PASSWORD,
      page: () => ForgetPasswordPage(),
    ),
    GetPage(
      name: Routes.ADD_ART_ONE,
      page: () => const AddArtOneScreen(),
    ),
    GetPage(
      name: Routes.ADD_ART_TWO,
      page: () => const AddArtTwoScreen(),
    ),
    GetPage(
      name: Routes.ADD_ART_THREE,
      page: () => const AddArtStepThreeUploadArtScreen(),
    ),
    GetPage(
      name: Routes.COLLECTION_DETAILS,
      page: () => const CollectionDetails(),
    ),
    GetPage(
      name: Routes.ART_DETAILS,
      page: () => ArtDetails(),
    ),
    GetPage(
      name: Routes.BUYER_ADDRESS,
      page: () => BuyerScreen(),
    ),
    GetPage(
      name: Routes.VIDEO_MEETING,
      page: () => VideoMeeting(),
    ),
    GetPage(
      name: Routes.second_home_dashboard,
      page: () => SecondHomeDashboard(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.SIGN_UP,
      page: () => SignUpPage(),
    ),
    GetPage(
      name: Routes.SELECTIONS_SCREEN,
      page: () => SelectionScreen(),
    ),
    GetPage(
      name: Routes.LOGIN_IN,
      page: () => LoginPage(),
    ),
    GetPage(
      name: Routes.COLOR_PAGE,
      page: () => ColorPage(),
    ),
    GetPage(
      name: Routes.CAMERA_PAGE,
      page: () => CameraPage(),
    ),
  ];
}
