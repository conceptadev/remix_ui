import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class AvatarStyles extends StyleRecipe<AvatarStyles> {
  const AvatarStyles({
    this.container = const Style.empty(),
    this.icon = const Style.empty(),
    this.label = const Style.empty(),
    this.image = const Style.empty(),
  });

  final Style container;
  final Style icon;
  final Style label;
  final Style image;

  factory AvatarStyles.base() {
    return AvatarStyles(
      container: _container(),
      icon: _icon(),
      label: _label(),
      image: _image(),
    );
  }

  @override
  AvatarStyles applyVariants(List<Variant> variants) {
    return AvatarStyles(
      container: container.applyVariants(variants),
      icon: icon.applyVariants(variants),
      label: label.applyVariants(variants),
      image: image.applyVariants(variants),
    );
  }

  @override
  AvatarStyles copyWith({
    Style? container,
    Style? icon,
    Style? label,
    Style? image,
  }) {
    return AvatarStyles(
      container: this.container.merge(container),
      icon: this.icon.merge(icon),
      label: this.label.merge(label),
      image: this.image.merge(image),
    );
  }

  @override
  AvatarStyles merge(AvatarStyles? other) {
    return copyWith(
      container: other?.container,
      icon: other?.icon,
      label: other?.label,
      image: other?.image,
    );
  }
}

Style _container() => Style.box(
      box.color(Colors.amber.withAlpha(50)),
      box.borderRadius(50),
      box.alignment.center(),
      box.width(40),
      box.height(40),
      box.clipBehavior.antiAlias(),
      box.foregroundDecoration.shape.circle(),
    );

Style _icon() => Style(
      icon.size(18),
      icon.color.amber(),
    );

Style _label() => Style.text(
      text.style.fontSize(16),
      text.style.color.black54(),
      text.style.fontWeight.bold(),
    );

Style _image() => Style.image(
      image.fit.cover(),
    );
