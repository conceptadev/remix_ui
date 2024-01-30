import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.style.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

class RemixCheckbox extends StatelessWidget {
  const RemixCheckbox({
    super.key,
    this.label,
    this.isDisabled = false,
    this.isChecked = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    CheckboxStyles? style,
  }) : _customStyle = style;

  final String? label;
  final bool isDisabled;
  final bool isChecked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  final CheckboxStyles? _customStyle;

  @override
  Widget build(BuildContext context) {
    var variant = isChecked ? CheckboxState.checked : CheckboxState.unchecked;

    final style = CheckboxStyles.build(_customStyle, [variant]);

    return Pressable(
      onPressed:
          onChanged == null || isDisabled ? null : () => onChanged!(!isChecked),
      child: HBox(
        style: style.outerContainer,
        children: [
          AnimatedBox(
            style: style.innerContainer,
            duration: const Duration(milliseconds: 150),
            child: StyledIcon(
              isChecked ? iconChecked : iconUnchecked,
              style: style.icon,
            ),
          ),
          if (label != null)
            StyledText(
              label!,
              style: style.label,
            ),
        ],
      ),
    );
  }
}
