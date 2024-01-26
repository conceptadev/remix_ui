import 'package:mix/mix.dart';

class CheckboxState extends Variant {
  const CheckboxState._(String name) : super(name);

  static const checked = CheckboxState._('checkedCheckboxVariant');
  static const unchecked = CheckboxState._('uncheckedCheckboxVariant');
}
