import 'package:go_router/go_router.dart';
<<<<<<< HEAD
=======
import 'package:muslim/app/featuers/azkar/ui/azkar_view.dart';
>>>>>>> a04869321ec8ea39d914516f999c2256de9d0fc1
import 'package:muslim/app/featuers/home/presentation/home_view.dart';
import 'package:muslim/app/featuers/qibla/presentation/qiblah_view.dart';
import 'package:muslim/app/shared/navigation_bar.dart';

class AppRouter {
  static const pageNavBar = '/pageNavBar';
  static const homeView = '/homeView';
  static const qiblaView = '/qiblaView';
  static const azkarPage = '/azkarPage';

  static final router = GoRouter(
    initialLocation: pageNavBar,
    routes: [
      GoRoute(
        path: pageNavBar,
        builder: (context, state) => const CustomPageNavigationBar(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: qiblaView,
        builder: (context, state) => const QiblahView(),
      ),
<<<<<<< HEAD
=======
      GoRoute(
        path: azkarPage,
        builder: (context, state) => const AzkarView(),
      ),
>>>>>>> a04869321ec8ea39d914516f999c2256de9d0fc1
    ],
  );
}
