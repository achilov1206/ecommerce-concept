import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
part 'product_info.model.g.dart';

ProductInfo productInfoFromJson(String str) =>
    ProductInfo.fromJson(json.decode(str));

String productInfoToJson(ProductInfo data) => json.encode(data.toJson());

class ProductInfo {
  ProductInfo({
    required this.cpu,
    required this.camera,
    required this.capacity,
    required this.color,
    required this.id,
    required this.images,
    required this.isFavorites,
    required this.price,
    required this.rating,
    required this.sd,
    required this.ssd,
    required this.title,
  });
  @JsonKey(name: 'CPU')
  final String cpu;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String id;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;
  final String title;

  factory ProductInfo.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);

  Map<String, dynamic> toJson() => _$CartToJson(this);
}
