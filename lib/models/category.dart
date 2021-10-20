import 'package:flutter/material.dart';

class Category {
  String id = UniqueKey().toString();
  String image;
  String name;

  Category(this.name, this.image);
}

class CategoriesList {
  List<Category> _list;

  List<Category> get list => _list;

  CategoriesList() {
    this._list = [
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
      new Category("Man Shirt", 'img/images/us.png'),
    ];
  }
}
