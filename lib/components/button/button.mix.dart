import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.variants.dart';
import 'package:remix_ui/helpers/color_utils.dart';
import 'package:remix_ui/tokens/typography.dart';

const buttonColor = Colors.blue;
final darkButtonColor = buttonColor[700]!;
final lightButtonColor = buttonColor[200]!.withOpacity(0.3);

final ghostButtonMix = Mix(
  iconColor(darkButtonColor),
  textColor(darkButtonColor),
  bgColor(Colors.transparent),
  onHover(
    bgColor(lightButtonColor),
  ),
);

final buttonMix = Mix(
  mainAxisSize(MainAxisSize.min),

  // Label
  textHeight(1.1),
  fontWeight(FontWeight.w600),

  onDisabled(
    opacity(0.5),
  ),

  // Sizes
  ButtonSize.xsmall(
    fontSize(remixTextSize.xs),
    iconSize(remixTextSize.xs),
    gap(4),
    py(8),
    px(8),
    rounded(4),
  ),

  ButtonSize.small(
    fontSize(remixTextSize.sm),
    iconSize(remixTextSize.sm),
    gap(4),
    py(10),
    px(16),
    rounded(4),
  ),

  ButtonSize.medium(
    fontSize(remixTextSize.md),
    iconSize(remixTextSize.md),
    gap(8),
    py(10),
    px(18),
    rounded(6),
  ),

  ButtonSize.large(
    fontSize(remixTextSize.lg),
    iconSize(remixTextSize.lg),
    gap(12),
    py(12),
    px(22),
    rounded(6),
  ),

  // Variants
  ButtonType.solid(
    iconColor(contrastColor(buttonColor)),
    textColor(contrastColor(buttonColor)),
    bgColor(buttonColor),
    onHover(
      bgColor(darkButtonColor),
    ),
  ),

  // Variants
  ButtonType.outline(
    apply(ghostButtonMix),
    border(
      color: darkButtonColor,
      width: 1,
    ),
  ),
  ButtonType.ghost(
    apply(ghostButtonMix),
  ),
  ButtonType.link(
    iconColor(buttonColor),
    textColor(buttonColor),
    bgColor(Colors.transparent),
    onHover(
      textDecoration(TextDecoration.underline),
    ),
  ),
);
