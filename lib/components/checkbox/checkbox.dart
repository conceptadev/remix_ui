import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.mix.dart';

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

class Checkbox extends RemixableWidget {
  const Checkbox({
    this.label,
    this.isDisabled = false,
    this.isChecked = false,
    this.isInvalid = false,
    this.defaultChecked = false,
    this.onChanged,
    this.iconChecked = Icons.check,
    this.iconUnchecked,
    Key? key,
    Mix? mix,
  }) : super(mix, key: key);

  final String? label;
  final bool isDisabled;
  final bool isChecked;
  final bool isInvalid;
  final bool defaultChecked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  @override
  Mix get baseMix => checkboxMix;

  @override
  Widget build(BuildContext context) {
    final onPressedFn = onChanged == null ? null : () => onChanged!(!isChecked);

    final style = Mix.variantSwitcher(mix, {
      isChecked: CheckboxState.checked,
      !isChecked: CheckboxState.unchecked,
    });

    return Pressable(
      onPressed: isDisabled ? null : onPressedFn,
      child: MixContextBuilder(
          mix: style,
          builder: (context, mixContext) {
            return Box(
              inherit: true,
              child: IconMix(
                isChecked ? iconChecked : iconUnchecked,
                // Hide if no unchecked icon and isChecked false
                mix: Mix(
                  hide(iconUnchecked == null && !isChecked),
                ),
              ),
            );
          }),
    );
  }
}
