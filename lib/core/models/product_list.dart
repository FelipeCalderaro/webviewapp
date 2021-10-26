// To parse this JSON data, do
//
//     final productList = productListFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductList productListFromJson(String str) =>
    ProductList.fromJson(json.decode(str));

String productListToJson(ProductList data) => json.encode(data.toJson());

class ProductList {
  ProductList({
    required this.listaProdutos,
  });

  final List<ListaProduto> listaProdutos;

  factory ProductList.fromJson(Map<String, dynamic> json) => ProductList(
        listaProdutos: List<ListaProduto>.from(
            json["listaProdutos"].map((x) => ListaProduto.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "listaProdutos":
            List<dynamic>.from(listaProdutos.map((x) => x.toJson())),
      };
}

class ListaProduto {
  ListaProduto({
    required this.id,
    required this.cod,
    required this.url,
  });

  final int id;
  final String cod;
  final String url;

  factory ListaProduto.fromJson(Map<String, dynamic> json) => ListaProduto(
        id: json["id"],
        cod: json["cod"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cod": cod,
        "url": url,
      };
}
