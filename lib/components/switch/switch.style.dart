import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'switch.variants.dart';

class SwitchStyles extends StyleRecipe<SwitchStyles> {
  const SwitchStyles({
    this.outerFlexContainer = const Style.empty(),
    this.innerContainer = const Style.empty(),
  });

  final Style outerFlexContainer;
  final Style innerContainer;

  factory SwitchStyles.baseForm() {
    return SwitchStyles(
      outerFlexContainer: _outerFlexContainerStyle(),
      innerContainer: _innerContainerStyle(),
    );
  }

  @override
  SwitchStyles applyVariants(List<Variant> variants) {
    return SwitchStyles(
      outerFlexContainer: outerFlexContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
    );
  }

  @override
  SwitchStyles copyWith({
    Style? outerFlexContainer,
    Style? innerContainer,
  }) {
    return SwitchStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      outerFlexContainer: this.outerFlexContainer.merge(outerFlexContainer),
    );
  }

  @override
  SwitchStyles merge(SwitchStyles? other) {
    return copyWith(
      outerFlexContainer: other?.outerFlexContainer,
      innerContainer: other?.innerContainer,
    );
  }
}

Style _outerFlexContainerStyle() => Style(
      box.width(32),
      box.height(16),
      border.all.width(2),
      border.all.strokeAlign(BorderSide.strokeAlignOutside),
      box.borderRadius.all(20),
      SwitchState.active(
        box.color.black(),
        border.all.color.black(),
        box.alignment.centerRight(),
      ),
      SwitchState.inactive(
        box.alignment.centerLeft(),
        box.color.grey.shade300(),
        border.all.color.grey.shade300(),
      ),
    );

Style _innerContainerStyle() => Style(
      box.borderRadius.all(10),
      width(16),
      height(16),
      box.color.white(),
    );
