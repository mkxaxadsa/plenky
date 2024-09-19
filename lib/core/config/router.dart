import 'package:go_router/go_router.dart';
export 'package:go_router/go_router.dart';

import '../../features/broken/pages/add_broken_page.dart';
import '../../features/broken/pages/add_broken_page2.dart';
import '../../features/broken/pages/add_broken_page3.dart';
import '../../features/broken/pages/edit_broken_page.dart';
import '../../features/home/pages/broken_items_page.dart';
import '../../features/home/pages/home_page.dart';
import '../../features/home/pages/settings_page.dart';
import '../../features/splash/onboard_page.dart';
import '../../features/splash/profile_page.dart';
import '../../features/splash/splash_page.dart';
import '../models/broken.dart';

class Routes {
  static String onboard = '/onboard';
  static String profile = '/profile';
  static String home = '/home';
  static String settings = '/settings';
  static String brokens = '/brokens';
  static String add = '/add';
  static String add2 = '/add2';
  static String add3 = '/add3';
  static String edit = '/edit';
}

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: Routes.onboard,
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: Routes.profile,
      builder: (context, state) => const ProfilePage(),
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: Routes.settings,
      builder: (context, state) => const SettingsPage(),
    ),
    GoRoute(
      path: Routes.brokens,
      builder: (context, state) => const BrokenItemsPage(),
    ),
    GoRoute(
      path: Routes.add,
      builder: (context, state) => const AddBrokenPage(),
    ),
    GoRoute(
      path: Routes.add2,
      builder: (context, state) => AddBrokenPage2(
        broken: state.extra as Broken,
      ),
    ),
    GoRoute(
      path: Routes.add3,
      builder: (context, state) => AddBrokenPage3(
        broken: state.extra as Broken,
      ),
    ),
    GoRoute(
      path: Routes.edit,
      builder: (context, state) => EditBrokenPage(
        broken: state.extra as Broken,
      ),
    ),
  ],
);
