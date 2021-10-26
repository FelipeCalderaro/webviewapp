import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:webviewapp/core/models/product_list.dart';
import 'package:http/http.dart' as http;

part 'products_state.dart';
part 'products_cubit.freezed.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(const ProductsState.loading()) {
    getProductList();
  }

  late final ProductList productList;

  Future<void> getProductList() async {
    try {
      final response = await http
          .get(Uri.parse('https://melhorlojavirtual.online/api/lista.json'));
      print(response);
      if (response.statusCode == 200) {
        productList = productListFromJson(response.body);
      }
      emit(const _Loaded());
    } catch (e) {
      emit(const _NoInternet());
    }
  }
}
