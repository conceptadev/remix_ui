import 'package:mix/mix.dart';

class ButtonSize extends Variant {
  ButtonSize._(String name) : super(name);
  // Sizes
  static final xsmall = ButtonSize._('xsmallButtonVariant');
  static final small = ButtonSize._('smallButtonVariant');
  static final medium = ButtonSize._('mediumButtonVariant');
  static final large = ButtonSize._('largeButtonVariant');
}

class ButtonType extends Variant {
  ButtonType._(String name) : super(name);
  // Types
  static final solid = ButtonType._('solidButtonVariant');
  static final outline = ButtonType._('outlineButtonVariant');
  static final ghost = ButtonType._('ghostButtonVariant');
  static final link = ButtonType._('linkButtonVariant');
}
