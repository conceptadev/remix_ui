import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

import 'tokens/checkbox_spec.dart';
import 'tokens/checkbox_util.dart';

final $defaultCheckboxStyle = AnimatedStyle(
  Style(
    // Flex Container
    $remix.checkbox.flexContainer.mainAxisAlignment.center(),
    $remix.checkbox.flexContainer.crossAxisAlignment.center(),
    $remix.checkbox.flexContainer.mainAxisSize.min(),
    $remix.checkbox.flexContainer.gap(6),
    // Inner Container
    $remix.checkbox.innerContainer.borderRadius.all(7),
    $remix.checkbox.innerContainer.width(20),
    $remix.checkbox.innerContainer.height(20),
    $remix.checkbox.innerContainer.border(
      color: const Color.fromARGB(115, 3, 3, 3),
      width: 1.5,
    ),
    // Label
    $remix.checkbox.label.style.fontSize(16),
    $remix.checkbox.label.style.bold(),
    $remix.checkbox.label.style.color.black87(),
    // Checked
    CheckboxState.checked(
      // Inner Container
      $remix.checkbox.innerContainer.color.black87(),
      // Icon
      $remix.checkbox.icon.color.white(),
      $remix.checkbox.icon.size(15),
    ),
  ),
  duration: Durations.extralong2,
  curve: Curves.bounceInOut,
);

class RemixCheckbox extends StatelessWidget {
  RemixCheckbox({
    super.key,
    this.label,
    this.disabled = false,
    this.checked = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    Style? style,
    this.variants = const [],
  }) : style = style ?? $defaultCheckboxStyle;

  final String? label;
  final bool disabled;
  final bool checked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  final Style style;

  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: $defaultCheckboxStyle.applyVariant(
        checked ? CheckboxState.checked : CheckboxState.unchecked,
      ),
      builder: (mix) {
        final spec = CheckboxSpec.of(mix);

        return Pressable(
          onPress:
              onChanged == null || disabled ? null : () => onChanged!(!checked),
          child: MixedFlex(
            spec: spec.flexContainer,
            direction: Axis.horizontal,
            children: [
              MixedBox(
                spec: spec.innerContainer,
                child: MixedIcon(
                  checked ? iconChecked : iconUnchecked,
                  spec: spec.icon,
                ),
              ),
              if (label != null)
                MixedText(
                  text: label!,
                  spec: spec.label,
                ),
            ],
          ),
        );
      },
    );
  }
}
