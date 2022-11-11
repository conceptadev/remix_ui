import 'package:mix/mix.dart';

class CheckboxState extends Variant {
  CheckboxState._(String name) : super(name);
  // Types
  static final checked = CheckboxState._('checkedCheckboxVariant');
  static final unchecked = CheckboxState._('uncheckedCheckboxVariant');
  static final invalid = CheckboxState._('invalidCheckboxVariant');
}

class CheckboxSize extends Variant {
  CheckboxSize._(String name) : super(name);

  static final xsmall = CheckboxSize._('xsmallCheckboxSize');
  static final small = CheckboxSize._('smallCheckboxSize');
  static final medium = CheckboxSize._('mediumCheckboxSize');
  static final large = CheckboxSize._('largeCheckboxSize');
}
