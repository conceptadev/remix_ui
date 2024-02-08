import 'package:flutter/material.dart';
import 'package:flutter_portal/flutter_portal.dart';
import 'package:mix/mix.dart';
import '../../utils/component_recipe.dart';
import 'popup_menu.style.dart';

class RemixPopupMenu extends StatefulWidget
    implements RemixComponentRecipe<PopupMenuStyles> {
  const RemixPopupMenu({
    required this.child,
    required this.items,
    this.style,
    this.variants = const [],
    super.key,
  });

  final Widget child;
  final List<Widget> items;

  @override
  final PopupMenuStyles? style;

  @override
  final List<Variant> variants;

  @override
  State<RemixPopupMenu> createState() => _RemixPopupMenuState();
}

class _RemixPopupMenuState extends State<RemixPopupMenu> {
  Style buildStyle(List<Variant> variants) {
    var styles = widget.style == null ? PopupMenuStyles.base() : widget.style!;

    return styles.applyVariants(variants).outerColumnContainer;
  }

  bool showingMenu = false;

  @override
  Widget build(BuildContext context) {
    return PortalTarget(
      visible: showingMenu,
      portalFollower: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          setState(() {
            showingMenu = false;
          });
        },
      ),
      child: PortalTarget(
        visible: showingMenu,
        anchor: const Aligned(
          follower: Alignment.topCenter,
          target: Alignment.bottomCenter,
          // widthFactor: 2,
          offset: Offset(
            0,
            10,
          ),
        ),
        portalFollower: VBox(
          style: buildStyle(widget.variants),
          children: widget.items,
        ),
        child: Pressable(
          child: widget.child,
          onPressed: () {
            setState(() {
              showingMenu = !showingMenu;
            });
          },
        ),
      ),
    );
  }
}
