import 'package:mix/mix.dart';

class RemixCardStyles extends StyleRecipe<RemixCardStyles> {
  const RemixCardStyles({
    this.container = const Style.empty(),
  });

  final Style container;

  factory RemixCardStyles.base() {
    return RemixCardStyles(
      container: _container(),
    );
  }

  @override
  RemixCardStyles applyVariants(List<Variant> variants) {
    return RemixCardStyles(
      container: container.applyVariants(variants),
    );
  }

  @override
  RemixCardStyles merge(RemixCardStyles? other) {
    if (other == null) return this;
    return copyWith(
      container: container.merge(other.container),
    );
  }

  @override
  RemixCardStyles copyWith({
    Style? container,
  }) {
    return RemixCardStyles(
      container: container ?? this.container,
    );
  }
}

Style _container() => Style(
      box.padding(16),
      box.elevation(1),
      box.borderRadius(8),
      box.color.white(),
    );
