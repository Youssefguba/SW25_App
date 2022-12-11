// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
   required this.products,
   required this.total,
   required this.skip,
   required this.limit,
  });

  final List<Product> products;
  final int total;
  final int skip;
  final int limit;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    total: json["total"],
    skip: json["skip"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "total": total,
    "skip": skip,
    "limit": limit,
  };
}

class Product {
  Product({
   required this.id,
   required this.title,
   required this.description,
   required this.price,
   required this.discountPercentage,
   required this.rating,
   required this.stock,
   required this.brand,
   required this.category,
   required this.thumbnail,
   required this.images,
  });

  final int id;
  final String title;
  final String description;
  final int price;
  final double discountPercentage;
  final double rating;
  final int stock;
  final String brand;
  final String category;
  final String thumbnail;
  final List<String> images;

  

  factory Product.fromJson(Map<String, dynamic> value) => Product(
    id: value["id"],
    title: value["title"],
    description: value["description"],
    price: value["price"],
    discountPercentage: value["discountPercentage"].toDouble(),
    rating: value["rating"].toDouble(),
    stock: value["stock"],
    brand: value["brand"],
    category: value["category"],
    thumbnail: value["thumbnail"],
    images: List<String>.from(value["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "price": price,
    "discountPercentage": discountPercentage,
    "rating": rating,
    "stock": stock,
    "brand": brand,
    "category": category,
    "thumbnail": thumbnail,
    "images": List<dynamic>.from(images.map((x) => x)),
  };
}
