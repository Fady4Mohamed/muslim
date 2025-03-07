import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:muslim/app/featuers/qibla/logic/cubit/qiblah_cubit.dart';
import 'package:muslim/app/featuers/qibla/presentation/qiblah_view.dart';

class AppRouter {
  static const qiblaView = '/qiblaView';

  static final router = GoRouter(
    initialLocation: qiblaView,
    routes: [
      GoRoute(
        path: qiblaView,
        builder: (context, state) => BlocProvider(
          create: (context) => QiblahCubit(),
          child: const QiblahView(),
        ),
      ),
    ],
  );
}
