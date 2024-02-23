import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.style.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

import '../../utils/component_recipe.dart';

class RemixCheckbox extends StatelessWidget
    implements RemixComponentRecipe<RemixCheckboxStyles> {
  const RemixCheckbox({
    super.key,
    this.label,
    this.isDisabled = false,
    this.isChecked = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.variants = const [],
  });

  final String? label;
  final bool isDisabled;
  final bool isChecked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  @override
  final RemixCheckboxStyles? style;

  @override
  final List<Variant> variants;

  RemixCheckboxStyles buildStyle(List<Variant> variants) {
    final result = style == null ? RemixCheckboxStyles.baseForm() : style!;

    return result.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    var internalVariants =
        isChecked ? CheckboxState.checked : CheckboxState.unchecked;

    final style = buildStyle([internalVariants, ...variants]);

    return Pressable(
      onPressed:
          onChanged == null || isDisabled ? null : () => onChanged!(!isChecked),
      child: HBox(
        style: style.flexContainer,
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
