import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/checkbox/checkbox.dart';
import 'package:remix_ui/helpers/color_utils.dart';

const color = Colors.blue;
final darkColor = color[700]!;
final lightColor = color[200]!.withOpacity(0.3);

Mix get checkboxMix => Mix(
      animated(),
      rounded(5),
      width(25),
      height(25),
      iconSize(18),
      borderWidth(2),
      borderColor(Colors.grey),
      disabled(
        opacity(0.5),
      ),
      hover(
        borderColor(color),
      ),
      CheckboxState.checked(
        iconColor(contrastColor(color)),
        bgColor(color),
        borderColor(color),
        hover(
          iconColor(contrastColor(darkColor)),
          bgColor(darkColor),
          borderColor(darkColor),
        ),
      ),
      CheckboxState.unchecked(),
      CheckboxState.invalid(
        bgColor(Colors.transparent),
        borderColor(Colors.red),
        hover(),
      ),
    );
