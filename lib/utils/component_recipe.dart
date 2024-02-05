import 'package:mix/mix.dart';

abstract class RemixComponentRecipe<T extends StyleRecipe<T>> {
  final T? style;
  final List<Variant> variants;

  RemixComponentRecipe(this.style, this.variants);

}
