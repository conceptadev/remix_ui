import 'package:mix/mix.dart';

class RemixAvatarStyles extends StyleRecipe<RemixAvatarStyles> {
  const RemixAvatarStyles({
    this.container = const Style.empty(),
    this.fallbackLabel = const Style.empty(),
    this.image = const Style.empty(),
  });

  final Style container;
  final Style fallbackLabel;
  final Style image;

  factory RemixAvatarStyles.base() {
    return RemixAvatarStyles(
      container: _container(),
      fallbackLabel: _label(),
      image: _image(),
    );
  }

  @override
  RemixAvatarStyles applyVariants(List<Variant> variants) {
    return RemixAvatarStyles(
      container: container.applyVariants(variants),
      fallbackLabel: fallbackLabel.applyVariants(variants),
      image: image.applyVariants(variants),
    );
  }

  @override
  RemixAvatarStyles copyWith({
    Style? container,
    Style? fallbackLabel,
    Style? image,
  }) {
    return RemixAvatarStyles(
      container: this.container.merge(container),
      fallbackLabel: this.fallbackLabel.merge(fallbackLabel),
      image: this.image.merge(image),
    );
  }

  @override
  RemixAvatarStyles merge(RemixAvatarStyles? other) {
    return copyWith(
      container: other?.container,
      fallbackLabel: other?.fallbackLabel,
      image: other?.image,
    );
  }
}

Style _container() => Style(
      box.color.grey.shade100(),
      box.borderRadius(50),
      box.alignment.center(),
      box.width(40),
      box.height(40),
      box.clipBehavior.antiAlias(),
      clip.oval(),
    );

Style _label() => Style.text(
      text.style.fontSize(16),
      text.style.color.black54(),
      text.style.fontWeight.bold(),
    );

Style _image() => Style.image(
      image.fit.cover(),
    );
