import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:remix_ui/components/button/button.variants.dart';

class ButtonStyles extends StyleRecipe<ButtonStyles> {
  const ButtonStyles({
    this.container = const Style.empty(),
    this.icon = const Style.empty(),
    this.label = const Style.empty(),
  });

  final Style container;
  final Style icon;
  final Style label;

  factory ButtonStyles.baseForm() {
    return ButtonStyles(
      container: _container(),
      icon: _icon(),
      label: _label(),
    );
  }

  factory ButtonStyles.build([
    ButtonStyles? other,
    List<Variant> variants = const [],
  ]) {
    return ButtonStyles(
      container: _container(),
      icon: _icon(),
      label: _label(),
    ).merge(other).applyVariants(variants);
  }

  @override
  ButtonStyles applyVariants(List<Variant> variants) {
    return ButtonStyles(
      container: container.applyVariants(variants),
      icon: icon.applyVariants(variants),
      label: label.applyVariants(variants),
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

Style _container() => Style(
      flex.gap(6),
      flex.mainAxisAlignment.center(),
      flex.crossAxisAlignment.center(),
      flex.mainAxisSize.min(),
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
        box.decoration.color.white(),
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

Style _icon() => Style(
      ButtonSize.xsmall(
        icon.size(12),
      ),
      ButtonSize.small(
        icon.size(14),
      ),
      ButtonSize.medium(
        icon.size(16),
      ),
      ButtonSize.large(
        icon.size(18),
      ),
      (ButtonType.primary | ButtonType.destructive)(
        icon.color(Colors.white),
      ),
      (ButtonType.link | ButtonType.secondary | ButtonType.outline)(
        icon.color(Colors.black),
      ),
    );

Style _label() => Style(
      text.style.height(1.1),
      text.style.letterSpacing(0.5),
      text.style.fontWeight(FontWeight.w600),
      ButtonSize.xsmall(
        text.style.fontSize(12),
      ),
      ButtonSize.small(
        text.style.fontSize(14),
      ),
      ButtonSize.medium(
        text.style.fontSize(16),
      ),
      ButtonSize.large(
        text.style.fontSize(18),
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
