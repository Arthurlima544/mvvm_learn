import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mvvm_learn/domain/models/booking/booking_summary.dart';
import 'package:mvvm_learn/ui/core/localization/applocalization.dart';
import 'package:mvvm_learn/ui/core/themes/colors.dart';
import 'package:mvvm_learn/ui/core/ui/error_indicator.dart';
import 'package:mvvm_learn/ui/home/viewmodel/home_viewmodel.dart';

import '../../../routing/routes.dart';
import '../../core/themes/dimens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.go(Routes.booking);
        },
        label: Text(AppLocalization.of(context).bookNewTrip),
      ),
      body: SafeArea(
        top: true,
        bottom: true,
        child: ListenableBuilder(
          listenable: widget.viewModel.load,
          builder: (context, child) {
            if (widget.viewModel.load.running) {
              return const Center(child: CircularProgressIndicator());
            }

            if (widget.viewModel.load.error) {
              return Center(
                child: ErrorIndicator(
                  title: AppLocalization.of(context).errorWhileLoadingHome,
                  label: AppLocalization.of(context).tryAgain,
                  onPressed: widget.viewModel.load.execute,
                ),
              );
            }
            return child!;
          },
          child: ListenableBuilder(
            listenable: widget.viewModel,
            builder: (context, _) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: Dimens.of(context).paddingScreenVertical,
                        horizontal: Dimens.of(context).paddingScreenHorizontal,
                      ),
                      child: HomeHeader(viewModel: widget.viewModel),
                    ),
                  ),
                  SliverList.builder(
                    itemCount: widget.viewModel.bookings.length,
                    itemBuilder: (_, index) => _Booking(
                      key: ValueKey(widget.viewModel.bookings[index].id),
                      booking: widget.viewModel.bookings[index],
                      onTap: () {},
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Booking extends StatelessWidget {
  const _Booking({super.key, required this.booking, required this.onTap});

  final BookingSummary booking;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(booking.id),
      child: Container(
        color: AppColors.grey1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(padding: EdgeInsets.only(right: Dimens.paddingHorizontal)),
          ],
        ),
      ),
    );
  }
}

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.viewModel});

  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => RadialGradient(
        colors: [Colors.purple.shade700, Colors.purple.shade400],
        center: Alignment.bottomLeft,
        radius: 2,
      ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        //Todo: Implement viewModel.userName when Auth() feature is done
        "Arthur",
        style: GoogleFonts.rubik(
          textStyle: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
