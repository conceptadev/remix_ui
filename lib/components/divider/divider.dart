import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'divider.style.dart';
import '../../utils/component_recipe.dart';

class RemixDivider extends StatelessWidget
    implements RemixComponentRecipe<RemixDividerStyles> {
  const RemixDivider({
    super.key,
    this.style,
    this.variants = const [],
  });

  @override
  final RemixDividerStyles? style;

  @override
  final List<Variant> variants;

  RemixDividerStyles buildStyle(List<Variant> variants) {
    var styles = style == null ? RemixDividerStyles.base() : style!;
    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: buildStyle(variants).container,
    );
  }
}
