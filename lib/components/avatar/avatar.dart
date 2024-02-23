import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import '../../helpers/widget_builder.dart';
import 'avatar.style.dart';
import '../../utils/component_recipe.dart';

class RemixAvatar extends StatelessWidget
    implements RemixComponentRecipe<RemixAvatarStyles> {
  const RemixAvatar({
    super.key,
    this.image,
    this.imageBuilder,
    this.fallbackLabel,
    this.fallbackLabelBuilder,
    this.style,
    this.variants = const [],
  });

  final ImageProvider<Object>? image;
  final String? fallbackLabel;
  final RemixWidgetBuilder<RemixAvatarStyles>? fallbackLabelBuilder;
  final RemixWidgetBuilder<RemixAvatarStyles>? imageBuilder;

  @override
  final RemixAvatarStyles? style;

  @override
  final List<Variant> variants;

  RemixAvatarStyles buildStyle(List<Variant> variants) {
    var styles = style == null ? RemixAvatarStyles.base() : style!;

    return styles.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);

    final imageWidget = imageBuilder != null
        ? imageBuilder!(style)
        : image != null
            ? StyledImage(
                image: image!,
                style: style.image,
                inherit: false,
              )
            : null;

    final fallbackLabelWidget = fallbackLabelBuilder != null
        ? fallbackLabelBuilder!(style)
        : fallbackLabel != null
            ? StyledText(fallbackLabel!, style: style.fallbackLabel)
            : null;

    return Box(
      style: style.container,
      child: imageWidget ?? fallbackLabelWidget,
    );
  }
}
