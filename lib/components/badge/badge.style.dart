import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class BadgeStyles extends StyleRecipe<BadgeStyles> {
  const BadgeStyles({
    this.outerRowContainer = const Style.empty(),
    this.icon = const Style.empty(),
    this.label = const Style.empty(),
  });

  final Style outerRowContainer;
  final Style icon;
  final Style label;

  factory BadgeStyles.base() {
    return BadgeStyles(
      outerRowContainer: _outerRowContainer(),
      icon: _icon(),
      label: _label(),
    );
  }

  @override
  BadgeStyles applyVariants(List<Variant> variants) {
    return BadgeStyles(
      outerRowContainer: outerRowContainer.applyVariants(variants),
      icon: icon.applyVariants(variants),
      label: label.applyVariants(variants),
    );
  }

  @override
  BadgeStyles copyWith({
    Style? outerRowContainer,
    Style? icon,
    Style? label,
  }) {
    return BadgeStyles(
      outerRowContainer: this.outerRowContainer.merge(outerRowContainer),
      icon: this.icon.merge(icon),
      label: this.label.merge(label),
    );
  }

  @override
  BadgeStyles merge(BadgeStyles? other) {
    return copyWith(
      outerRowContainer: other?.outerRowContainer,
      icon: other?.icon,
      label: other?.label,
    );
  }
}

Style _outerRowContainer() => Style(
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

Style _icon() => Style.icon(
      icon.size(12),
      icon.color.white(),
    );

Style _label() => Style.text(
      text.style.fontSize(12),
      text.style.fontWeight.w600(),
      text.style.color.white(),
    );
