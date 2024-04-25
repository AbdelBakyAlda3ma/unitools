import 'package:flutter/material.dart';

class ItemModel {
  final String image, title, subTitle, university, type,category;
  final String? faculty;
   IconData? icon;
  ItemModel( 
      {this.faculty,
      this.icon = Icons.favorite_outline,
      required this.category,
      required this.image,
      required this.title,
      required this.subTitle,
      required this.university,
      required this.type});
}
