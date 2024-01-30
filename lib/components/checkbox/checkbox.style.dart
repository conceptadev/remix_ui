import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';

class CheckboxStyles extends StyleRecipe<CheckboxStyles> {
  const CheckboxStyles({
    required this.outerContainer,
    required this.innerContainer,
    required this.icon,
    required this.label,
  });

  final Style outerContainer;
  final Style innerContainer;
  final Style icon;
  final Style label;

  factory CheckboxStyles.build(
      [CheckboxStyles? other, List<Variant> variants = const []]) {
    return CheckboxStyles(
      outerContainer: _outerContainerStyle(),
      innerContainer: _innerContainerStyle(),
      icon: _iconStyle(),
      label: _labelStyle(),
    ).merge(other).applyVariants(variants);
  }

  @override
  CheckboxStyles applyVariants(List<Variant> variants) {
    return CheckboxStyles(
      outerContainer: outerContainer.applyVariants(variants),
      innerContainer: innerContainer.applyVariants(variants),
      icon: icon.applyVariants(variants),
      label: label.applyVariants(variants),
    );
  }

  @override
  CheckboxStyles copyWith({
    Style? outerContainer,
    Style? innerContainer,
    Style? icon,
    Style? label,
  }) {
    return CheckboxStyles(
      innerContainer: this.innerContainer.merge(innerContainer),
      icon: this.icon.merge(icon),
      label: this.label.merge(label),
      outerContainer: this.outerContainer.merge(outerContainer),
    );
  }

  @override
  CheckboxStyles merge(CheckboxStyles? other) {
    return copyWith(
      outerContainer: other?.outerContainer,
      innerContainer: other?.innerContainer,
      icon: other?.icon,
      label: other?.label,
    );
  }
}

Style _outerContainerStyle() => Style(
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
