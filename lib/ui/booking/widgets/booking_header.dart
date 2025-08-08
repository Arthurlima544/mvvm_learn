import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/booking/booking.dart';
import '../../../utils/image_error_listener.dart';
import '../../core/themes/dimens.dart';
import '../../core/ui/date_format_start_end.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key, required this.booking});

  final Booking booking;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_Top(booking: booking)],
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _HeaderImage(booking: booking),
          _Headline(booking: booking),
        ],
      ),
    );
  }
}

class _Headline extends StatelessWidget {
  const _Headline({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomStart,
      child: Padding(
        padding: Dimens.of(context).edgeInsertsScreenSymmetric,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              booking.destination.name,
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Text(
              dateFormatStartEnd(
                DateTimeRange(start: booking.startDate, end: booking.endDate),
              ),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderImage extends StatelessWidget {
  const _HeaderImage({required this.booking});

  final Booking booking;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fitWidth,
      imageUrl: booking.destination.imageUrl,
      errorListener: imageErrorListener,
    );
  }
}
