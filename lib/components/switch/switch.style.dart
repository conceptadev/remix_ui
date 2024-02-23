import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

import 'switch.variants.dart';

class RemixSwitchStyles extends StyleRecipe<RemixSwitchStyles> {
  const RemixSwitchStyles({
    this.outerFlexContainer = const Style.empty(),
    this.innerContainer = const Style.empty(),
  });

  final Style outerFlexContainer;
  final Style innerContainer;

  factory RemixSwitchStyles.baseForm() {
    return RemixSwitchStyles(
      outerFlexContainer: _outerFlexContainerStyle(),
      innerContainer: _innerContainerStyle(),
    );
  }

  @override
  RemixSwitchStyles applyVariants(List<Variant> variants) {
    return RemixSwitchStyles(
      outerFlexContainer: outerFlexContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
    );
  }

  @override
  RemixSwitchStyles copyWith({
    Style? outerFlexContainer,
    Style? innerContainer,
  }) {
    return RemixSwitchStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      outerFlexContainer: this.outerFlexContainer.merge(outerFlexContainer),
    );
  }

  @override
  RemixSwitchStyles merge(RemixSwitchStyles? other) {
    return copyWith(
      outerFlexContainer: other?.outerFlexContainer,
      innerContainer: other?.innerContainer,
    );
  }
}

Style _outerFlexContainerStyle() => Style(
      box.width(32),
      box.height(16),
      border.width(2),
      border.strokeAlign(BorderSide.strokeAlignOutside),
      box.borderRadius(20),
      SwitchState.active(
        box.color.black(),
        border.color.black(),
        box.alignment.centerRight(),
      ),
      SwitchState.inactive(
        box.alignment.centerLeft(),
        box.color.grey.shade300(),
        border.color.grey.shade300(),
      ),
    );

Style _innerContainerStyle() => Style(
      box.borderRadius(10),
      width(16),
      height(16),
      box.color.white(),
    );
