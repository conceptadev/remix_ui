import 'package:mix/mix.dart';

abstract class StylableComponent<T extends StylableComponent<T>> {
  const StylableComponent();

  StylableComponent<T> merge(covariant StylableComponent<T>? other);

  StylableComponent<T> selectVariants(List<Variant> variants);

  StylableComponent<T> copyWith();
}
