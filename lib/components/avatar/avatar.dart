import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'avatar.style.dart';
import '../../utils/component_recipe.dart';

class RemixAvatar extends StatelessWidget
    implements RemixComponentRecipe<AvatarStyles> {
  const RemixAvatar({
    super.key,
    this.child,
    this.backgroundImage,
    this.foregroundImage,
    this.style,
    this.variants = const [],
  });

  final Widget? child;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;

  @override
  final AvatarStyles? style;

  @override
  final List<Variant> variants;

  Style buildStyle(List<Variant> variants) {
    var styles = style == null ? AvatarStyles.base() : style!;
    styles = styles.applyVariants(variants);

    return Style.combine([
      styles.container,
      styles.icon,
      styles.label,
      styles.image,
      if (backgroundImage != null)
        Style(box.decoration.image(backgroundImage!)),
      if (foregroundImage != null)
        Style(box.foregroundDecoration.image(foregroundImage!)),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: buildStyle(variants),
      child: child,
    );
  }
}
