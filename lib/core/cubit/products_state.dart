part of 'products_cubit.dart';

@freezed
abstract class ProductsState with _$ProductsState {
  const factory ProductsState.loading() = _Loading;
  const factory ProductsState.loaded() = _Loaded;
  const factory ProductsState.noInternet() = _NoInternet;
}
