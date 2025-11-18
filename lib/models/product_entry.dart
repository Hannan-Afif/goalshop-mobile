// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

ProductEntry productEntryFromJson(String str) => ProductEntry.fromJson(json.decode(str));

String productEntryToJson(ProductEntry data) => json.encode(data.toJson());

class ProductEntry {
    String id;
    String name;
    String description;
    String category;
    int price;
    String thumbnail;
    int productViews;
    bool isFeatured;
    int userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.description,
        required this.category,
        required this.price,
        required this.thumbnail,
        required this.productViews,
        required this.isFeatured,
        required this.userId,
    });

    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        price: json["price"],
        thumbnail: json["thumbnail"],
        productViews: json["product_views"],
        isFeatured: json["is_featured"],
        userId: json["user_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "price": price,
        "thumbnail": thumbnail,
        "product_views": productViews,
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
