import 'package:mix/mix.dart';

class DividerStyles extends StyleRecipe<DividerStyles> {
  const DividerStyles({
    this.container = const Style.empty(),
  });

  final Style container;

  factory DividerStyles.base() {
    return DividerStyles(
      container: _container(),
    );
  }

  @override
  DividerStyles applyVariants(List<Variant> variants) {
    return DividerStyles(
      container: container.applyVariants(variants),
    );
  }

  @override
  DividerStyles copyWith({
    Style? container,
  }) {
    return DividerStyles(
      container: this.container.merge(container),
    );
  }

  @override
  DividerStyles merge(DividerStyles? other) {
    return copyWith(
      container: other?.container,
    );
  }
}

Style _container() => Style(
      box.margin.vertical(15),
      box.height(2),
      box.borderRadius(1),
      box.color.grey.shade200(),
    );
