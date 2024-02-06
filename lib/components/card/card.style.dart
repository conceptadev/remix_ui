import 'package:mix/mix.dart';

class CardStyles extends StyleRecipe<CardStyles> {
  const CardStyles({
    this.container = const Style.empty(),
  });

  final Style container;

  factory CardStyles.build([
    CardStyles? other,
    List<Variant> variants = const [],
  ]) {
    return CardStyles.defaults().merge(other).applyVariants(variants);
  }

  factory CardStyles.defaults() {
    return CardStyles(
      container: _container(),
    );
  }

  @override
  CardStyles applyVariants(List<Variant> variants) {
    return CardStyles(
      container: container.applyVariants(variants),
    );
  }

  @override
  CardStyles merge(CardStyles? other) {
    if (other == null) return this;
    return copyWith(
      container: container.merge(other.container),
    );
  }

  @override
  CardStyles copyWith({
    Style? container,
  }) {
    return CardStyles(
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
