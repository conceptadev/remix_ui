import 'package:mix/mix.dart';

class ButtonSize extends Variant {
  const ButtonSize._(super.name);
  // Sizes
  static const xsmall = ButtonSize._('remix.button.xsmall');
  static const small = ButtonSize._('remix.button.small');
  static const medium = ButtonSize._('remix.button.medium');
  static const large = ButtonSize._('remix.button.large');

  static const values = [
    xsmall,
    small,
    medium,
    large,
  ];
}

class ButtonType extends Variant {
  const ButtonType._(super.name);
  // Types
  static const primary = ButtonType._('remix.button.primary');
  static const secondary = ButtonType._('remix.button.secondary');
  static const destructive = ButtonType._('remix.button.destructive');
  static const outline = ButtonType._('remix.button.outline');
  static const ghost = ButtonType._('remix.button.ghost');
  static const link = ButtonType._('remix.button.link');

  static const values = [
    primary,
    secondary,
    destructive,
    outline,
    ghost,
    link,
  ];
}
