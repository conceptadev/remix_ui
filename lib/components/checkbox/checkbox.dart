import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.mix.dart';
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
    Key? key,
    Mix? mix,
  })  : _customMix = mix,
        super(key: key);

  final String? label;
  final bool isDisabled;
  final bool isChecked;
  final bool isInvalid;
  final bool defaultChecked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  final Mix? _customMix;

  Mix get mix => checkboxMix.maybeApply(_customMix);

  @override
  Widget build(BuildContext context) {
    final onPressedFn = onChanged == null ? null : () => onChanged!(!isChecked);

    final shouldHideIcon = iconUnchecked == null && !isChecked;

    return Pressable(
      onPressed: isDisabled ? null : onPressedFn,
      child: MixContextBuilder(
          mix: mix,
          variants: [
            isChecked ? CheckboxState.checked : CheckboxState.unchecked
          ],
          builder: (context, mixContext) {
            return Box(
              inherit: true,
              child: IconMix(
                isChecked ? iconChecked : iconUnchecked,
                // Hide if no unchecked icon and isChecked false
                mix: Mix(hide(shouldHideIcon)),
              ),
            );
          }),
    );
  }
}
