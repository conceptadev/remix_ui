import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/card/card.style.dart';

import '../../utils/component_recipe.dart';

class PresableRemixCard extends RemixCard {
  const PresableRemixCard({
    super.key,
    required super.child,
    this.onTap,
    super.style,
  });

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Pressable(
      onPressed: onTap,
      child: super.build(context),
    );
  }
}

class RemixCard extends StatelessWidget
    implements RemixComponentRecipe<RemixCardStyles> {
  const RemixCard({
    super.key,
    required this.child,
    this.style,
    this.variants = const [],
  });

  factory RemixCard.pressable(
    Widget child, {
    void Function()? onTap,
    RemixCardStyles? style,
  }) {
    return PresableRemixCard(
      style: style,
      onTap: onTap,
      child: child,
    );
  }

  final Widget child;

  @override
  final RemixCardStyles? style;

  @override
  final List<Variant> variants;

  RemixCardStyles buildStyle(List<Variant> variants) {
    final result = style == null ? RemixCardStyles.base() : style!;

    return result.applyVariants(variants);
  }

  @override
  Widget build(BuildContext context) {
    final style = buildStyle(variants);

    return Box(
      style: style.container,
      child: child,
    );
  }
}
