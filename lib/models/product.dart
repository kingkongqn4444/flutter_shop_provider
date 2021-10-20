import 'package:flutter/material.dart';

class Product {
  String id = UniqueKey().toString();
  String name;
  String image;
  double price;
  String brand;

  int available;
  int quantity;
  int sales;
  double rate;
  double discount;

  Product(this.brand, this.name, this.image, this.available, this.price,
      this.quantity, this.sales, this.rate, this.discount);

  String getPrices({double price}) {
    if (price != null) {
      return '\$${price.toStringAsFixed(2)}';
    }
    return '\$${this.price.toStringAsFixed(2)}';
  }
}

class ProductList {
  List<Product> _list;
  List<Product> get list => _list;

  ProductList() {
    _list = [
      new Product("Nike", 'Maxi Dress For Women Summer', 'img/pro1.webp', 25,
          36.12, 200, 130, 4.3, 12.1),
      new Product("Nike", 'Black Checked Retro Hepburn Style', 'img/pro2.webp',
          60, 12.65, 200, 63, 5.0, 20.2),
      new Product("Nike", 'Robe pin up Vintage Dress Autumn', 'img/pro3.webp',
          10, 66.96, 200, 415, 4.9, 15.3),
      new Product("Nike", 'Elegant Casual Dress', 'img/pro4.webp', 80, 63.98,
          200, 2554, 3.1, 10.5),
      new Product("Nike", 'Maxi Dress For Women Summer', 'img/pro1.webp', 25,
          36.12, 200, 130, 4.3, 12.1),
      new Product("Nike", 'Black Checked Retro Hepburn Style', 'img/pro2.webp',
          60, 12.65, 200, 63, 5.0, 20.2),
      new Product("Nike", 'Robe pin up Vintage Dress Autumn', 'img/pro3.webp',
          10, 66.96, 200, 415, 4.9, 15.3),
      new Product("Nike", 'Elegant Casual Dress', 'img/pro4.webp', 80, 63.98,
          200, 2554, 3.1, 10.5),
      new Product("Nike", 'Maxi Dress For Women Summer', 'img/pro1.webp', 25,
          36.12, 200, 130, 4.3, 12.1),
      new Product("Nike", 'Black Checked Retro Hepburn Style', 'img/pro2.webp',
          60, 12.65, 200, 63, 5.0, 20.2),
      new Product("Nike", 'Robe pin up Vintage Dress Autumn', 'img/pro3.webp',
          10, 66.96, 200, 415, 4.9, 15.3),
      new Product("Nike", 'Elegant Casual Dress', 'img/pro4.webp', 80, 63.98,
          200, 2554, 3.1, 10.5),
    ];
  }
}
