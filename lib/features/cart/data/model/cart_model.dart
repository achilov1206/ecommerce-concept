import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'cart_model.g.dart';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

@JsonSerializable()
class Cart {
  Cart({
    required this.basket,
    required this.delivery,
    required this.id,
    required this.total,
  });

  final List<Basket> basket;
  final String delivery;
  final String id;
  final int total;

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}

@JsonSerializable()
class Basket {
  Basket({
    required this.id,
    required this.images,
    required this.price,
    required this.title,
  });

  final int id;
  final String images;
  final int price;
  final String title;

  factory Basket.fromJson(Map<String, dynamic> json) => Basket(
        id: json["id"],
        images: json["images"],
        price: json["price"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "images": images,
        "price": price,
        "title": title,
      };
}
