import 'package:flutter/widgets.dart';
import 'package:mix/mix.dart';

typedef RemixWidgetBuilder<T extends StyleRecipe<T>> = Widget Function(T style);
