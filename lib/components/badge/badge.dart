import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'badge.style.dart';
import '../../utils/component_recipe.dart';

class RemixBadge extends StatelessWidget
    implements RemixComponentRecipe<BadgeStyles> {
  const RemixBadge({
    super.key,
    this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.style,
    this.variants = const [],
  });

  final String? label;
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  @override
  final BadgeStyles? style;

  @override
  final List<Variant> variants;

  Style buildStyle(List<Variant> variants) {
    var styles = style == null ? BadgeStyles.base() : style!;
    styles = styles.applyVariants(variants);

    return styles.outerRowContainer.merge(styles.icon).merge(styles.label);
  }

  @override
  Widget build(BuildContext context) {
    return PressableBox(
      onPressed: () {},
      child: HBox(
        style: buildStyle(variants),
        children: [
          if (leadingIcon != null) leadingIcon!,
          if (label != null) StyledText(label!),
          if (trailingIcon != null) trailingIcon!,
        ],
      ),
    );
  }
}
