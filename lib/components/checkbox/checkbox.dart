import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'package:remix_ui/components/checkbox/checkbox.variants.dart';
import 'package:remix_ui/components/checkbox/tokens/checkbox_attr.dart';

import 'tokens/checkbox_spec.dart';
import 'tokens/checkbox_util.dart';

AnimatedStyle $defaultCheckboxStyle() {
  final checkbox = CheckboxSpecUtility((value) => CheckboxSpecAttribute(
        flexContainer: value.flexContainer,
        innerContainer: value.innerContainer,
        icon: value.icon,
        label: value.label,
      ));

  return Style(
    // Flex Container
    checkbox.flexContainer.mainAxisAlignment.center(),
    checkbox.flexContainer.crossAxisAlignment.center(),
    checkbox.flexContainer.mainAxisSize.min(),
    checkbox.flexContainer.gap(6),
    // Inner Container
    checkbox.innerContainer.borderRadius.all(7),
    checkbox.innerContainer.width(20),
    checkbox.innerContainer.height(20),
    checkbox.innerContainer.border(
      color: const Color.fromARGB(115, 3, 3, 3),
      width: 1.5,
    ),
    // Label
    checkbox.label.style.fontSize(16),
    checkbox.label.style.color.black87(),
    checkbox.icon.color.white(),

    // Checked
    CheckboxState.checked(
      // Inner Container
      checkbox.innerContainer.color.black87(),
      // Icon
      checkbox.icon.color.white(),
      checkbox.icon.size(15),
      // Label
      checkbox.label.style.fontSize(16),
      checkbox.label.style.bold(),
      checkbox.label.style.color.black87(),
    ),
  ).animate(
    curve: Curves.easeInOut,
    duration: const Duration(milliseconds: 200),
  );
}

class RemixCheckbox extends StatelessWidget {
  RemixCheckbox({
    super.key,
    this.label,
    this.disabled = false,
    this.value = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    Style? style,
    this.variants = const [],
  }) : style = style ?? $defaultCheckboxStyle();

  final String? label;
  final bool disabled;
  final bool value;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  final Style style;

  final List<Variant> variants;

  @override
  Widget build(BuildContext context) {
    return MixBuilder(
      style: style.applyVariant(
        value ? CheckboxState.checked : CheckboxState.unchecked,
      ),
      builder: (mix) {
        final spec = CheckboxSpec.of(mix);
        final duration = mix.animation?.duration ?? Duration.zero;
        final curve = mix.animation?.curve ?? Curves.linear;
        return Pressable(
          onPress:
              onChanged == null || disabled ? null : () => onChanged!(!value),
          child: MixedFlex(
            spec: spec.flexContainer,
            direction: Axis.horizontal,
            children: [
              AnimatedMixedBox(
                spec: spec.innerContainer,
                duration: duration,
                child: AnimatedMixedIcon(
                  icon: value ? iconChecked : iconUnchecked,
                  spec: spec.icon,
                  duration: duration,
                  curve: curve,
                ),
              ),
              if (label != null)
                AnimatedMixedText(
                  text: label!,
                  spec: spec.label,
                  duration: duration,
                  curve: curve,
                ),
            ],
          ),
        );
      },
    );
  }
}
