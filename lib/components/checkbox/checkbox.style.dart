import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

class RemixCheckboxStyles extends StyleRecipe<RemixCheckboxStyles> {
  const RemixCheckboxStyles({
    required this.flexContainer,
    required this.innerContainer,
    required this.icon,
    required this.label,
  });

  final Style flexContainer;
  final Style innerContainer;
  final Style icon;
  final Style label;

  factory RemixCheckboxStyles.baseForm() {
    return RemixCheckboxStyles(
      flexContainer: _flexContainerStyle(),
      innerContainer: _innerContainerStyle(),
      icon: _iconStyle(),
      label: _labelStyle(),
    );
  }

  @override
  RemixCheckboxStyles applyVariants(List<Variant> variants) {
    return RemixCheckboxStyles(
      flexContainer: flexContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
      icon: icon.applyVariants(variants),
      label: label.applyVariants(variants),
    );
  }

  @override
  RemixCheckboxStyles copyWith({
    Style? flexContainer,
    Style? innerContainer,
    Style? icon,
    Style? label,
  }) {
    return RemixCheckboxStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      icon: this.icon.merge(icon),
      label: this.label.merge(label),
      flexContainer: this.flexContainer.merge(flexContainer),
    );
  }

  @override
  RemixCheckboxStyles merge(RemixCheckboxStyles? other) {
    return copyWith(
      flexContainer: other?.flexContainer,
      innerContainer: other?.innerContainer,
      icon: other?.icon,
      label: other?.label,
    );
  }
}

Style _flexContainerStyle() => Style(
      flex.mainAxisAlignment.center(),
      flex.crossAxisAlignment.center(),
      flex.mainAxisSize.min(),
      flex.gap(6),
    );

Style _innerContainerStyle() => Style(
      box.borderRadius.all(7),
      width(20),
      height(20),
      border(color: const Color.fromARGB(115, 3, 3, 3), width: 1.5),
      CheckboxState.checked(
        backgroundColor(Colors.black87),
      ),
    );

Style _iconStyle() => Style(
      CheckboxState.checked(
        icon.color.white(),
        icon.size(15),
      ),
    );

Style _labelStyle() => Style(
      text.style.fontSize(16),
      text.style.bold(),
      text.style.color.black87(),
    );
