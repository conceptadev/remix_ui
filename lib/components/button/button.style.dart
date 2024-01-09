import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.variants.dart';
import 'package:remix_ui/helpers/color_utils.dart';
import 'package:remix_ui/tokens/typography.dart';

import '../../factory/stylable_component.dart';

class ButtonStyles extends StylableComponent<ButtonStyles> {
  const ButtonStyles({
    required this.container,
    required this.icon,
    required this.label,
  });

  final Style container;
  final Style icon;
  final Style label;

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
      container: container.variantList(variants),
      icon: icon.variantList(variants),
      label: label.variantList(variants),
    );
  }

  @override
  ButtonStyles copyWith({
    Style? container,
    Style? icon,
    Style? label,
  }) {
    return ButtonStyles(
      container: this.container.merge(container),
      icon: this.icon.merge(icon),
      label: this.label.merge(label),
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

final _container = Style(
  ButtonSize.xsmall(
    box.padding.horizontal(8),
    box.padding.vertical(4),
  ),
  ButtonSize.small(
    box.padding.horizontal(12),
    box.padding.vertical(6),
  ),
  ButtonSize.medium(
    box.padding.horizontal(16),
    box.padding.vertical(8),
  ),
  ButtonSize.large(
    box.padding.horizontal(20),
    box.padding.vertical(10),
  ),
  ButtonType.primary(
    box.decoration.color.black(),
    onHover(
      box.decoration.color.black87(),
    ),
  ),
  ButtonType.secondary(
    box.decoration.color.grey.shade200(),
    onHover(
      box.decoration.color.grey.shade100(),
    ),
  ),
  ButtonType.destructive(
    box.decoration.color.redAccent(),
    onHover(
      box.decoration.color.redAccent.shade200(),
    ),
  ),
  ButtonType.outline(
    box.decoration.color(Colors.white),
    box.decoration.border(width: 1.5, color: Colors.black12),
    box.decoration.boxShadow.color(Colors.black12.withOpacity(0.1)),
    box.decoration.boxShadow.blurRadius(1),
  ),
  ButtonType.ghost(
    box.decoration.color(Colors.transparent),
    onHover(
      box.decoration.color(Colors.black12),
    ),
  ),
  ButtonType.link(
    box.decoration.color(Colors.transparent),
  ),
  box.decoration.borderRadius(6),
);

final _icon = Style(
  ButtonSize.xsmall(
    icon.size(remixTextSize.xs),
  ),
  ButtonSize.small(
    icon.size(remixTextSize.sm),
  ),
  ButtonSize.medium(
    icon.size(remixTextSize.md),
  ),
  ButtonSize.large(
    icon.size(remixTextSize.lg),
  ),
  ButtonType.primary(
    icon.color(Colors.white),
  ),
  // Variants
  ButtonType.outline(
      // iconColor(darkButtonColor),
      ),
  ButtonType.ghost(
      // iconColor(darkButtonColor),
      ),
  ButtonType.link(
      // iconColor(buttonColor),
      ),
);

final _label = Style(
  text.style.height(1.1),
  text.style.letterSpacing(0.5),
  text.style.fontWeight(FontWeight.w600),
  ButtonSize.xsmall(
    text.style.fontSize(remixTextSize.xs),
  ),
  ButtonSize.small(
    text.style.fontSize(remixTextSize.sm),
  ),
  ButtonSize.medium(
    text.style.fontSize(remixTextSize.md),
  ),
  ButtonSize.large(
    text.style.fontSize(remixTextSize.lg),
  ),
  ButtonType.primary(
    text.style.color.white(),
  ),
  ButtonType.secondary(
    text.style.color.black87(),
  ),
  ButtonType.destructive(
    text.style.color.white(),
  ),
  ButtonType.outline(
    text.style.color.black(),
  ),
  ButtonType.ghost(
    text.style.color.black(),
  ),
  ButtonType.link(
    text.style.color.black(),
    onHover(
      text.style.decoration(TextDecoration.underline),
    ),
  ),
);
