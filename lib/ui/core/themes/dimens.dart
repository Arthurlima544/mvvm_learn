import 'package:flutter/material.dart';

abstract final class Dimens {
  const Dimens();

  static const paddingHorizontal = 20.0;

  static const paddingVertical = 24.0;

  double get paddingScreenHorizontal;

  double get paddingScreenVertical;

  double get profilePictureSize;

  EdgeInsets get edgeInsertsScreenhorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  EdgeInsets get edgeInsertsScreenSymmetric => EdgeInsets.symmetric(
    horizontal: paddingHorizontal,
    vertical: paddingVertical,
  );

  static const Dimens desktop = _DimensDesktop();

  static const Dimens mobile = _DimensMobile();

  factory Dimens.of(BuildContext context) =>
      switch (MediaQuery.sizeOf(context).width) {
        > 600 && < 840 => desktop,
        _ => mobile,
      };
}

final class _DimensMobile extends Dimens {
  @override
  double get paddingScreenHorizontal => Dimens.paddingHorizontal;

  @override
  double get paddingScreenVertical => Dimens.paddingVertical;

  @override
  double get profilePictureSize => 64.0;

  const _DimensMobile();
}

final class _DimensDesktop extends Dimens {
  @override
  double get paddingScreenHorizontal => 100.0;

  @override
  double get paddingScreenVertical => 64.0;

  @override
  double get profilePictureSize => 128.0;

  const _DimensDesktop();
}
