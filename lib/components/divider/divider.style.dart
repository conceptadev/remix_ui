import 'package:mix/mix.dart';

class RemixDividerStyles extends StyleRecipe<RemixDividerStyles> {
  const RemixDividerStyles({
    this.container = const Style.empty(),
  });

  final Style container;

  factory RemixDividerStyles.base() {
    return RemixDividerStyles(
      container: _container(),
    );
  }

  @override
  RemixDividerStyles applyVariants(List<Variant> variants) {
    return RemixDividerStyles(
      container: container.applyVariants(variants),
    );
  }

  @override
  RemixDividerStyles copyWith({
    Style? container,
  }) {
    return RemixDividerStyles(
      container: this.container.merge(container),
    );
  }

  @override
  RemixDividerStyles merge(RemixDividerStyles? other) {
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
