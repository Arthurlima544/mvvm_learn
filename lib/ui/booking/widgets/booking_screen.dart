// final BookingViewModel viewModel;

import 'package:flutter/material.dart';
import 'package:mvvm_learn/ui/booking/widgets/booking_body.dart';
import 'package:mvvm_learn/ui/core/localization/applocalization.dart';
import 'package:mvvm_learn/ui/booking/viewmodel/booking_viewmodel.dart';

import '../../core/ui/error_indicator.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key, required this.viewModel});

  final BookingViewModel viewModel;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Scaffold(
        body: ListenableBuilder(
          listenable: widget.viewModel.createBooking,
          builder: (context, child) {
            if (widget.viewModel.createBooking.running) {
              return const Center(child: CircularProgressIndicator());
            }
            if (widget.viewModel.createBooking.error) {
              return Center(
                child: ErrorIndicator(
                  title: AppLocalization.of(context).errorWhileLoadingbooking,
                  label: AppLocalization.of(context).tryAgain,
                  onPressed: widget.viewModel.createBooking.execute,
                ),
              );
            }
            return child!;
          },
          child: BookingBody(viewModel: widget.viewModel),
        ),
      ),
    );
  }
}
