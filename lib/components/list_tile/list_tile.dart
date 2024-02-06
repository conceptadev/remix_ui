import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'list_tile.style.dart';
import '../../utils/component_recipe.dart';

class RemixListTile extends StatelessWidget
    implements RemixComponentRecipe<ListTileStyles> {
  const RemixListTile({
    super.key,
    this.title,
    this.subtitle,
    this.leading,
    this.trailing,
    this.style,
    this.variants = const [],
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final Widget? trailing;

  @override
  final ListTileStyles? style;

  @override
  final List<Variant> variants;

  ListTileStyles buildStyle(List<Variant> variants) {
    var styles = style == null ? ListTileStyles.base() : style!;
    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final styles = buildStyle(variants);

    return HBox(
      style: styles.outerRowContainer,
      children: [
        if (leading != null) leading!,
        VBox(
          style: styles.innerColumnContainer,
          children: [
            if (title != null)
              MixProvider.build(
                context,
                style: styles.title,
                builder: (mix) => title!,
              ),
            if (subtitle != null)
              MixProvider.build(
                context,
                style: styles.subtitle,
                builder: (mix) => subtitle!,
              ),
          ],
        ),
        const Spacer(),
        if (trailing != null) trailing!,
      ],
    );
  }
}
