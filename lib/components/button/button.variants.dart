import 'package:mix/mix.dart';

class ButtonSize extends Variant {
  const ButtonSize._(super.name);
  // Sizes
  static const xsmall = ButtonSize._('xsmallButtonVariant');
  static const small = ButtonSize._('smallButtonVariant');
  static const medium = ButtonSize._('mediumButtonVariant');
  static const large = ButtonSize._('largeButtonVariant');
}

class ButtonType extends Variant {
  const ButtonType._(super.name);
  // Types
  static const primary = ButtonType._('primaryButtonVariant');
  static const secondary = ButtonType._('secondaryButtonVariant');
  static const destructive = ButtonType._('destructiveButtonVariant');
  static const outline = ButtonType._('outlineButtonVariant');
  static const ghost = ButtonType._('ghostButtonVariant');
  static const link = ButtonType._('linkButtonVariant');
}
