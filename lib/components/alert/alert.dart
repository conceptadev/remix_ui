import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/alert/alert.style.dart';
import 'package:remix_ui/components/card/card.style.dart';

import '../../utils/component_recipe.dart';

class RemixAlert extends StatelessWidget
    implements RemixComponentRecipe<AlertStyles> {
  const RemixAlert({
    super.key,
    this.leading,
    this.title,
    this.subtitle,
    this.style,
    this.variants = const [],
  });

  final Widget? leading;
  final Widget? title;
  final Widget? subtitle;

  @override
  final AlertStyles? style;

  @override
  final List<Variant> variants;

  AlertStyles buildStyle(List<Variant> variants) {
    final result = style == null ? AlertStyles.base() : style!;
    return result.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);

    return HBox(
      style: style.outerRowContainer,
      children: [
        if (leading != null)
          MixProvider.build(
            context,
            style: style.icon,
            builder: (_) => leading!,
          ),
        VBox(
          style: style.innerColumnContainer,
          children: [
            if (title != null)
              MixProvider.build(
                context,
                style: style.title,
                builder: (_) => title!,
              ),
            if (subtitle != null)
              MixProvider.build(
                context,
                style: style.subtitle,
                builder: (_) => subtitle!,
              ),
          ],
        ),
      ],
    );
  }
}
