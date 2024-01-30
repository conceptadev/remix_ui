import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'radio.variants.dart';

class RadioStyles extends StyleRecipe<RadioStyles> {
  const RadioStyles({
    required this.outerContainer,
    required this.innerContainer,
    required this.label,
    required this.row,
  });

  final Style outerContainer;
  final Style innerContainer;
  final Style label;
  final Style row;

  factory RadioStyles.defaults() {
    return RadioStyles(
      outerContainer: _outerContainerStyle(),
      innerContainer: _innerContainerStyle(),
      label: _labelStyle(),
      row: _hboxStyle(),
    );
  }

  @override
  RadioStyles selectVariants(List<Variant> variants) {
    return RadioStyles(
      outerContainer: outerContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
      label: label.applyVariants(variants),
      row: row.applyVariants(variants),
    );
  }

  @override
  RadioStyles copyWith({
    Style? outerContainer,
    Style? innerContainer,
    Style? label,
    Style? row,
  }) {
    return RadioStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      outerContainer: this.outerContainer.merge(outerContainer),
      label: this.label.merge(label),
      row: this.row.merge(row),
    );
  }

  @override
  RadioStyles merge(RadioStyles? other) {
    return copyWith(
      outerContainer: other?.outerContainer,
      innerContainer: other?.innerContainer,
      label: other?.label,
      row: other?.row,
    );
  }
}

Style _outerContainerStyle() => Style(
      box.width(16),
      box.height(16),
      box.alignment.center(),
      box.borderRadius.all(10),
      box.color.transparent(),
      box.border.all(width: 1.5, color: Colors.black87),
    );

Style _innerContainerStyle() => Style(
      box.borderRadius.all(10),
      box.color.black87(),
      RadioState.active(
        box.width(8.5),
        box.height(8.5),
      ),
      RadioState.inactive(
        box.width(0),
        box.height(0),
      ),
    );

Style _labelStyle() => Style(
      text.style.fontSize(16),
      text.style.bold(),
      text.style.color.black87(),
    );

Style _hboxStyle() => Style(
      flex.mainAxisAlignment.center(),
      flex.crossAxisAlignment.center(),
      flex.mainAxisSize.min(),
      flex.gap(6),
    );
