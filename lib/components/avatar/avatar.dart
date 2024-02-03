import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'avatar.style.dart';

class RemixAvatar extends StatelessWidget {
  const RemixAvatar({
    super.key,
    this.child,
    this.backgroundImage,
    this.foregroundImage,
    this.style,
    this.variants = const [],
  });

  final Widget? child;
  final AvatarStyles? style;
  final List<Variant> variants;
  final ImageProvider<Object>? backgroundImage;
  final ImageProvider<Object>? foregroundImage;

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
