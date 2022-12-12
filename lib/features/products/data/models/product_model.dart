import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'product_model.g.dart';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

@JsonSerializable()
class Product {
  Product({
    required this.homeStore,
    required this.bestSeller,
  });
  @JsonKey(name: 'home_store')
  final List<HomeStore> homeStore;
  @JsonKey(name: 'best_seller')
  final List<BestSeller> bestSeller;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        homeStore: List<HomeStore>.from(
            json["home_store"].map((x) => HomeStore.fromJson(x))),
        bestSeller: List<BestSeller>.from(
            json["best_seller"].map((x) => BestSeller.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "home_store": List<dynamic>.from(homeStore.map((x) => x.toJson())),
        "best_seller": List<dynamic>.from(bestSeller.map((x) => x.toJson())),
      };
}

@JsonSerializable()
class BestSeller {
  BestSeller({
    required this.id,
    required this.isFavorites,
    required this.title,
    required this.priceWithoutDiscount,
    required this.discountPrice,
    required this.picture,
  });
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'is_favorites')
  final bool isFavorites;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'price_without_discount')
  final int priceWithoutDiscount;
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  @JsonKey(name: 'picture')
  final String picture;

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        id: json["id"],
        isFavorites: json["is_favorites"],
        title: json["title"],
        priceWithoutDiscount: json["price_without_discount"],
        discountPrice: json["discount_price"],
        picture: json["picture"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_favorites": isFavorites,
        "title": title,
        "price_without_discount": priceWithoutDiscount,
        "discount_price": discountPrice,
        "picture": picture,
      };
}

@JsonSerializable()
class HomeStore {
  HomeStore({
    required this.id,
    this.isNew,
    required this.title,
    required this.subtitle,
    required this.picture,
    required this.isBuy,
  });
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'is_new')
  final bool? isNew;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'subtitle')
  final String subtitle;
  @JsonKey(name: 'picture')
  final String picture;
  @JsonKey(name: 'is_buy')
  final bool isBuy;

  factory HomeStore.fromJson(Map<String, dynamic> json) => HomeStore(
        id: json["id"],
        isNew: json["is_new"],
        title: json["title"],
        subtitle: json["subtitle"],
        picture: json["picture"],
        isBuy: json["is_buy"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_new": isNew,
        "title": title,
        "subtitle": subtitle,
        "picture": picture,
        "is_buy": isBuy,
      };
}
