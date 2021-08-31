import 'dart:convert';
Product productFromJson(String str) {
  return Product.fromJson(json.decode(str));
}
String productToJson(Product data) {
  return json.encode(data.toJson());
}

class Product {
  final String name;
  final int price;
  final String image;

  Product({
    this.name,
    this.price,
    this.image,
  });

  Product copyWith({
    String name,
    int price,
    String image,
  }) {
    return Product(
        name: name ?? this.name,
        price: price ?? this.price,
        image: image ?? this.image,
      );
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
    name: json["name"] == null ? null : json["name"],
    price: json["price"] == null ? null : json["price"],
    image: json["image"] == null ? null : json["image"],
  );
  }

  Map<String, dynamic> toJson() {
    return {
    "name": name == null ? null : name,
    "price": price == null ? null : price,
    "image": image == null ? null : image,
  };
  }
}
