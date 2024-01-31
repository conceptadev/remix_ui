import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'switch.variants.dart';

class SwitchStyles extends StyleRecipe<SwitchStyles> {
  const SwitchStyles({
    this.outerContainer = const Style.empty(),
    this.innerContainer = const Style.empty(),
  });

  final Style outerContainer;
  final Style innerContainer;

  factory SwitchStyles.build([
    SwitchStyles? other,
    List<Variant> variants = const [],
  ]) {
    return SwitchStyles(
      outerContainer: _outerContainerStyle(),
      innerContainer: _innerContainerStyle(),
    ).merge(other).applyVariants(variants);
  }

  @override
  SwitchStyles applyVariants(List<Variant> variants) {
    return SwitchStyles(
      outerContainer: outerContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
    );
  }

  @override
  SwitchStyles copyWith({
    Style? outerContainer,
    Style? innerContainer,
  }) {
    return SwitchStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      outerContainer: this.outerContainer.merge(outerContainer),
    );
  }

  @override
  SwitchStyles merge(SwitchStyles? other) {
    return copyWith(
      outerContainer: other?.outerContainer,
      innerContainer: other?.innerContainer,
    );
  }
}

Style _outerContainerStyle() => Style(
      box.width(32),
      box.height(20),
      padding.all(2),
      box.borderRadius.all(10),
      SwitchState.active(
        box.color.white(),
        box.alignment.centerRight(),
      ),
      SwitchState.inactive(
        box.alignment.centerLeft(),
        box.color.grey.shade700(),
      ),
    );

Style _innerContainerStyle() => Style(
      box.borderRadius.all(10),
      width(16),
      height(16),
      box.color(Colors.black),
    );
