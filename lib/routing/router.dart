import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mvvm_learn/data/repositories/auth/auth_repository.dart';
import 'package:mvvm_learn/routing/routes.dart';
import 'package:mvvm_learn/ui/auth/login/view_models/login_viewmodel.dart';
import 'package:mvvm_learn/ui/auth/login/widgets/login_screen.dart';
import 'package:mvvm_learn/ui/booking/viewmodel/booking_viewmodel.dart';
import 'package:mvvm_learn/ui/home/viewmodel/home_viewmodel.dart';
import 'package:mvvm_learn/ui/home/widgets/home_screen.dart';
import 'package:provider/provider.dart';

import '../ui/booking/widgets/booking_screen.dart';

GoRouter router(AuthRepository authRepository) => GoRouter(
  initialLocation: Routes.home,
  debugLogDiagnostics: true,
  redirect: _redirect,
  refreshListenable: authRepository,
  routes: [
    GoRoute(
      path: Routes.login,
      builder: (context, state) {
        return LoginScreen(
          viewModel: LoginViewModel(authRepository: context.read()),
        );
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        final viewModel = HomeViewModel(
          bookingRepository: context.read(),
          userRepository: context.read(),
        );
        return HomeScreen(viewModel: viewModel);
      },
    ),
    GoRoute(
      path: Routes.booking,
      builder: (context, state) {
        final viewModel = BookingViewModel(
          itineraryConfigRepository: context.read(),
          bookingCreateUseCase: context.read(),
          bookingRepository: context.read(),
        );
        return BookingScreen(viewModel: viewModel);
      },
    ),
  ],
);

FutureOr<String?> _redirect(BuildContext context, GoRouterState state) async {
  final loggedIn = await context.read<AuthRepository>().isAuthenticated;
  final loggingIn = state.matchedLocation == Routes.login;

  if (!loggedIn) {
    return Routes.login;
  }

  if (loggingIn) {
    return Routes.home;
  }

  return null;
}
