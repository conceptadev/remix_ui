import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/card/card.style.dart';

class PresableRemixCard extends RemixCard {
  const PresableRemixCard({
    super.key,
    required super.child,
    void Function()? onTap,
    super.style,
  });
}

class RemixCard extends StatelessWidget {
  const RemixCard({
    super.key,
    required this.child,
    CardStyles? style,
  }) : _customStyle = style;

  final Widget child;

  final CardStyles? _customStyle;

  factory RemixCard.pressable(
    Widget child, {
    void Function()? onTap,
    CardStyles? style,
  }) {
    return PresableRemixCard(
      style: style,
      onTap: onTap,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = CardStyles.build(_customStyle);

    return Box(
      style: style.container,
      child: child,
    );
  }
}
