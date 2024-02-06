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

    return styles.container
        .merge(styles.icon)
        .merge(styles.label)
        .merge(styles.image)
        .merge(
          Style.create([
            if (backgroundImage != null) box.decoration.image(backgroundImage!),
            if (foregroundImage != null)
              box.foregroundDecoration.image(foregroundImage!),
          ]),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Box(
      style: buildStyle(variants),
      child: child,
    );
  }
}
