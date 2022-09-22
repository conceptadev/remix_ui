import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.dart';
import 'package:remix_ui/helpers/color_utils.dart';
import 'package:remix_ui/tokens/typography.dart';

const buttonColor = Colors.blue;
final darkButtonColor = buttonColor[700]!;
final lightButtonColor = buttonColor[200]!.withOpacity(0.3);

final ghostBtnMix = Mix(
  iconColor(darkButtonColor),
  textColor(darkButtonColor),
  bgColor(Colors.transparent),
  hover(
    bgColor(lightButtonColor),
  ),
);

final buttonMix = Mix(
  mainAxisSize(MainAxisSize.min),

  // Label
  textHeight(1.1),
  fontWeight(FontWeight.w600),

  disabled(
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
  ButtonVariant.solid(
    iconColor(contrastColor(buttonColor)),
    textColor(contrastColor(buttonColor)),
    bgColor(buttonColor),
    hover(
      bgColor(darkButtonColor),
    ),
  ),

  // Variants
  ButtonVariant.outline(
    apply(ghostBtnMix),
    border(
      color: darkButtonColor,
      width: 1,
    ),
  ),
  ButtonVariant.ghost(
    apply(ghostBtnMix),
  ),
  ButtonVariant.link(
    iconColor(buttonColor),
    textColor(buttonColor),
    bgColor(Colors.transparent),
    hover(
      textDecoration(TextDecoration.underline),
    ),
  ),
);
