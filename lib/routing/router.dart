import 'package:go_router/go_router.dart';
import 'package:mvvm_learn/routing/routes.dart';
import 'package:mvvm_learn/ui/booking/viewmodel/booking_viewmodel.dart';
import 'package:mvvm_learn/ui/home/viewmodel/home_viewmodel.dart';
import 'package:mvvm_learn/ui/home/widgets/home_screen.dart';
import 'package:provider/provider.dart';

import '../ui/booking/widgets/booking_screen.dart';

GoRouter router() => GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        final viewModel = HomeViewModel(bookingRepository: context.read());
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
