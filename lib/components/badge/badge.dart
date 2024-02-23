import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'badge.style.dart';
import '../../utils/component_recipe.dart';

class RemixBadge extends StatelessWidget
    implements RemixComponentRecipe<RemixBadgeStyles> {
  const RemixBadge({
    super.key,
    required this.label,
    this.style,
    this.variants = const [],
  });

  final String label;

  @override
  final RemixBadgeStyles? style;

  @override
  final List<Variant> variants;

  RemixBadgeStyles buildStyle(List<Variant> variants) {
    var styles = style == null ? RemixBadgeStyles.base() : style!;
    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);
    return Box(
      style: style.container,
      child: StyledText(
        label,
        style: style.label,
      ),
    );
  }
}
