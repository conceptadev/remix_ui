import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.style.dart';
import 'package:remix_ui/components/checkbox/checkbox.variants.dart';
import 'package:remix_ui/helpers/color_utils.dart';

const color = Colors.blue;
final darkColor = color[700]!;
final lightColor = color[200]!.withOpacity(0.3);

class CheckboxStyles extends MixableStyle<CheckboxStyles> {
  const CheckboxStyles({
    required this.container,
    required this.icon,
  });

  final StyleMix container;
  final StyleMix icon;

  factory CheckboxStyles.defaults() {
    return CheckboxStyles(
      container: _container,
      icon: _icon,
    );
  }

  @override
  CheckboxStyles selectVariants(List<Variant> variants) {
    return CheckboxStyles(
      container: container.selectVariants(variants),
      icon: icon.selectVariants(variants),
    );
  }

  @override
  CheckboxStyles copyWith({
    StyleMix? container,
    StyleMix? icon,
    StyleMix? label,
  }) {
    return CheckboxStyles(
      container: this.container.mergeNullable(container),
      icon: this.icon.mergeNullable(icon),
    );
  }

  @override
  CheckboxStyles merge(CheckboxStyles? other) {
    return copyWith(
      container: other?.container,
      icon: other?.icon,
    );
  }
}

final _container = StyleMix(
  // Base styles
  rounded(5),
  width(25),
  height(25),
  border(color: Colors.grey, width: 2),

  // State changes
  onDisabled(
    opacity(0.5),
  ),
  onHover(
    border(color: color),
  ),

  // Variants
  CheckboxState.checked(
    backgroundColor(color),
    border(color: color),
    onHover(
      backgroundColor(darkColor),
      border(color: darkColor),
    ),
  ),

  CheckboxState.unchecked(),
  CheckboxState.invalid(
    backgroundColor(Colors.transparent),
    border(color: Colors.red),
  ),
);

final _icon = StyleMix(
  iconSize(18),
  CheckboxState.checked(
    iconColor(contrastColor(color)),
    onHover(
      iconColor(contrastColor(darkColor)),
    ),
  ),
  CheckboxState.unchecked(),
  CheckboxState.invalid(),
);
