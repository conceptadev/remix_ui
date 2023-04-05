import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.style.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

class Checkbox extends StatelessWidget {
  const Checkbox({
    this.label,
    this.isDisabled = false,
    this.isChecked = false,
    this.isInvalid = false,
    this.defaultChecked = false,
    this.onChanged,
    this.iconChecked = Icons.check,
    this.iconUnchecked,
    super.key,
    CheckboxStyles? style,
  }) : _customStyle = style;

  final String? label;
  final bool isDisabled;
  final bool isChecked;
  final bool isInvalid;
  final bool defaultChecked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  final CheckboxStyles? _customStyle;

  @override
  Widget build(BuildContext context) {
    var selectedVariant =
        isChecked ? CheckboxState.checked : CheckboxState.unchecked;
    selectedVariant = isInvalid ? CheckboxState.invalid : selectedVariant;

    final style = CheckboxStyles.defaults()
        .merge(_customStyle)
        .selectVariants([selectedVariant]);

    final onPressedFn = onChanged == null ? null : () => onChanged!(!isChecked);

    final shouldHideIcon = iconUnchecked == null && !isChecked;

    return Pressable(
      onPressed: isDisabled ? null : onPressedFn,
      child: Box(
        mix: style.container,
        child: IconMix(
          isChecked ? iconChecked : iconUnchecked,
          // Hide if no unchecked icon and isChecked false
          mix: StyleMix.chooser(
            condition: shouldHideIcon,
            ifTrue: StyleMix.constant,
            ifFalse: style.icon,
          ),
        ),
      ),
    );
  }
}
