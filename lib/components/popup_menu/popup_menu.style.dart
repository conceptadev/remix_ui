import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

class PopupMenuStyles extends StyleRecipe<PopupMenuStyles> {
  const PopupMenuStyles({
    this.outerColumnContainer = const Style.empty(),
  });

  final Style outerColumnContainer;

  factory PopupMenuStyles.base() {
    return PopupMenuStyles(
      outerColumnContainer: _outerColumnContainer(),
    );
  }

  @override
  PopupMenuStyles applyVariants(List<Variant> variants) {
    return PopupMenuStyles(
      outerColumnContainer: outerColumnContainer.applyVariants(variants),
    );
  }

  @override
  PopupMenuStyles copyWith({
    Style? outerColumnContainer,
  }) {
    return PopupMenuStyles(
      outerColumnContainer:
          this.outerColumnContainer.merge(outerColumnContainer),
    );
  }

  @override
  PopupMenuStyles merge(PopupMenuStyles? other) {
    return copyWith(
      outerColumnContainer: other?.outerColumnContainer,
    );
  }
}

Style _outerColumnContainer() => Style(
      box.padding.all(8),
      box.color.grey.shade100(),
      box.borderRadius(8),
      flex.gap(8),
    );
