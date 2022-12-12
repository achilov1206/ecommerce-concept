// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductInfo _$CartFromJson(Map<String, dynamic> json) => ProductInfo(
      cpu: json["CPU"],
      camera: json["camera"],
      capacity: List<String>.from(json["capacity"].map((x) => x)),
      color: List<String>.from(json["color"].map((x) => x)),
      id: json["id"],
      images: List<String>.from(json["images"].map((x) => x)),
      isFavorites: json["isFavorites"],
      price: json["price"],
      rating: json["rating"].toDouble(),
      sd: json["sd"],
      ssd: json["ssd"],
      title: json["title"],
    );

Map<String, dynamic> _$CartToJson(ProductInfo instance) => <String, dynamic>{
      "CPU": instance.cpu,
      "camera": instance.camera,
      "capacity": List<dynamic>.from(instance.capacity.map((x) => x)),
      "color": List<dynamic>.from(instance.color.map((x) => x)),
      "id": instance.id,
      "images": List<dynamic>.from(instance.images.map((x) => x)),
      "isFavorites": instance.isFavorites,
      "price": instance.price,
      "rating": instance.rating,
      "sd": instance.sd,
      "ssd": instance.ssd,
      "title": instance.title,
    };
