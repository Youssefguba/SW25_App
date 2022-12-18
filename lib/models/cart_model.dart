// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

class CartModel {
  CartModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  final int id;
  final List<CartProduct> products;
  final int total;
  final int discountedTotal;
  final int userId;
  final int totalProducts;
  final int totalQuantity;

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        id: json["id"],
        products: List<CartProduct>.from(
            json["products"].map((val) => CartProduct.fromJson(val))),
        total: json["total"],
        discountedTotal: json["discountedTotal"],
        userId: json["userId"],
        totalProducts: json["totalProducts"],
        totalQuantity: json["totalQuantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "discountedTotal": discountedTotal,
        "userId": userId,
        "totalProducts": totalProducts,
        "totalQuantity": totalQuantity,
      };
}

class CartProduct {
  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedPrice,
  });

  final int id;
  final String title;
  final int price;
  int quantity;
  final int total;
  final double discountPercentage;
  final int discountedPrice;

  factory CartProduct.fromJson(Map<String, dynamic> json) => CartProduct(
        id: json["id"], // 59,
        title: json["title"],
        price: json["price"],
        quantity: json["quantity"],
        total: json["total"],
        discountPercentage: json["discountPercentage"].toDouble(),
        discountedPrice: json["discountedPrice"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "quantity": quantity,
        "total": total,
        "discountPercentage": discountPercentage,
        "discountedPrice": discountedPrice,
      };
}
