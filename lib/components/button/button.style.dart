import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.variants.dart';
import 'package:remix_ui/helpers/color_utils.dart';
import 'package:remix_ui/tokens/typography.dart';

const buttonColor = Colors.blue;
final darkButtonColor = buttonColor[700]!;
final lightButtonColor = buttonColor[200]!.withOpacity(0.3);

abstract class MixableStyle<T extends MixableStyle<T>> {
  const MixableStyle();

  MixableStyle<T> merge(covariant MixableStyle<T>? other);

  MixableStyle<T> selectVariants(List<Variant> variants);

  MixableStyle<T> copyWith();
}

class ButtonStyles extends MixableStyle<ButtonStyles> {
  const ButtonStyles({
    required this.container,
    required this.icon,
    required this.label,
  });

  final StyleMix container;
  final StyleMix icon;
  final StyleMix label;

  factory ButtonStyles.defaults() {
    return ButtonStyles(
      container: _container,
      icon: _icon,
      label: _label,
    );
  }

  @override
  ButtonStyles selectVariants(List<Variant> variants) {
    return ButtonStyles(
      container: container.selectVariants(variants),
      icon: icon.selectVariants(variants),
      label: label.selectVariants(variants),
    );
  }

  @override
  ButtonStyles copyWith({
    StyleMix? container,
    StyleMix? icon,
    StyleMix? label,
  }) {
    return ButtonStyles(
      container: this.container.mergeNullable(container),
      icon: this.icon.mergeNullable(icon),
      label: this.label.mergeNullable(label),
    );
  }

  @override
  ButtonStyles merge(ButtonStyles? other) {
    return copyWith(
      container: other?.container,
      icon: other?.icon,
      label: other?.label,
    );
  }
}

final _container = StyleMix(
  mainAxisSize(
    MainAxisSize.min,
  ),
  onDisabled(
    opacity(0.5),
  ),
  rounded(4),
  gap(4),
  ButtonSize.xsmall(
    paddingSymmetric(
      horizontal: 8,
      vertical: 8,
    ),
  ),
  ButtonSize.small(
    paddingSymmetric(
      horizontal: 16,
      vertical: 10,
    ),
  ),
  ButtonSize.medium(
    gap(8),
    rounded(6),
    paddingSymmetric(
      horizontal: 18,
      vertical: 10,
    ),
  ),
  ButtonSize.large(
    gap(12),
    rounded(6),
    paddingSymmetric(
      horizontal: 22,
      vertical: 12,
    ),
  ),

  ButtonType.solid(
    backgroundColor(buttonColor),
    onHover(
      backgroundColor(darkButtonColor),
    ),
  ),

  // Variants
  ButtonType.outline(
    backgroundColor(
      Colors.transparent,
    ),
    border(
      color: darkButtonColor,
      width: 1,
    ),
    onHover(
      backgroundColor(
        lightButtonColor,
      ),
    ),
  ),
  ButtonType.ghost(
    backgroundColor(
      Colors.transparent,
    ),
    onHover(
      backgroundColor(
        lightButtonColor,
      ),
    ),
  ),
  ButtonType.link(
    backgroundColor(
      Colors.transparent,
    ),
  ),
);

final _icon = StyleMix(
  ButtonSize.xsmall(
    iconSize(remixTextSize.xs),
  ),
  ButtonSize.small(
    iconSize(remixTextSize.sm),
  ),
  ButtonSize.medium(
    iconSize(remixTextSize.md),
  ),
  ButtonSize.large(
    iconSize(remixTextSize.lg),
  ),

  ButtonType.solid(
    iconColor(contrastColor(buttonColor)),
  ),

  // Variants
  ButtonType.outline(
    iconColor(darkButtonColor),
  ),
  ButtonType.ghost(
    iconColor(darkButtonColor),
  ),
  ButtonType.link(
    iconColor(buttonColor),
  ),
);

final _label = StyleMix(
  textStyle(
    height: 1.1,
    fontWeight: FontWeight.w600,
  ),
  ButtonSize.xsmall(
    textStyle(
      fontSize: remixTextSize.xs,
    ),
  ),
  ButtonSize.small(
    textStyle(
      fontSize: remixTextSize.sm,
    ),
  ),
  ButtonSize.medium(
    textStyle(
      fontSize: remixTextSize.md,
    ),
  ),
  ButtonSize.large(
    textStyle(
      fontSize: remixTextSize.lg,
    ),
  ),

  // Variants
  ButtonType.solid(
    textStyle(
      color: contrastColor(buttonColor),
    ),
  ),

  ButtonType.outline(
    textStyle(
      color: darkButtonColor,
    ),
  ),
  ButtonType.ghost(
    textStyle(
      color: darkButtonColor,
    ),
  ),
  ButtonType.link(
    textStyle(
      color: buttonColor,
    ),
    onHover(
      textStyle(
        decoration: TextDecoration.underline,
      ),
    ),
  ),
);
