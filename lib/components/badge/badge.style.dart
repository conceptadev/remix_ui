import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class RemixBadgeStyles extends StyleRecipe<RemixBadgeStyles> {
  const RemixBadgeStyles({
    this.container = const Style.empty(),
    this.label = const Style.empty(),
  });

  final Style container;
  final Style label;

  factory RemixBadgeStyles.base() {
    return RemixBadgeStyles(
      container: _container(),
      label: _label(),
    );
  }

  @override
  RemixBadgeStyles applyVariants(List<Variant> variants) {
    return RemixBadgeStyles(
      container: container.applyVariants(variants),
      label: label.applyVariants(variants),
    );
  }

  @override
  RemixBadgeStyles copyWith({
    Style? container,
    Style? label,
  }) {
    return RemixBadgeStyles(
      container: this.container.merge(container),
      label: this.label.merge(label),
    );
  }

  @override
  RemixBadgeStyles merge(RemixBadgeStyles? other) {
    return copyWith(
      container: other?.container,
      label: other?.label,
    );
  }
}

Style _container() => Style(
      flex.mainAxisAlignment.center(),
      flex.mainAxisSize.min(),
      flex.crossAxisAlignment.center(),
      flex.gap(4),
      box.padding.horizontal(10),
      box.padding.vertical(2),
      box.borderRadius(20),
      box.color.black(),
      onHover(
        box.color(Colors.black.withOpacity(0.8)),
      ),
    );

Style _label() => Style.text(
      text.style.fontSize(12),
      text.style.fontWeight.w600(),
      text.style.color.white(),
    );
