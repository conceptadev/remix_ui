import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.style.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

import '../../utils/component_recipe.dart';

class RemixCheckbox extends StatelessWidget
    implements RemixComponentRecipe<RemixCheckboxStyle> {
  const RemixCheckbox({
    super.key,
    this.label,
    this.disabled = false,
    this.checked = false,
    this.onChanged,
    this.iconChecked = Icons.check_rounded,
    this.iconUnchecked,
    this.style,
    this.variants = const [],
  });

  final String? label;
  final bool disabled;
  final bool checked;
  final IconData iconChecked;
  final IconData? iconUnchecked;
  final ValueChanged<bool>? onChanged;

  @override
  final RemixCheckboxStyle? style;

  @override
  final List<Variant> variants;

  RemixCheckboxStyle buildStyle(List<Variant> variants) {
    final result = style == null ? RemixCheckboxStyle.base() : style!;

    return result.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    var internalVariants =
        checked ? CheckboxState.checked : CheckboxState.unchecked;

    final style = buildStyle([internalVariants, ...variants]);

    return Pressable(
      onPressed:
          onChanged == null || disabled ? null : () => onChanged!(!checked),
      child: HBox(
        style: style.flexContainer,
        children: [
          Box(
            style: style.innerContainer,
            child: StyledIcon(
              checked ? iconChecked : iconUnchecked,
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
