
import 'dart:io';

import 'package:flutter/material.dart';

class Product {
final String id;
final String tittle;
final String description;
final int price;
final String image;
final bool isfavourite; //  type
final String userId;
final bool isFeatured;
List<String>images;
double rating;
List<String> reviews;
int quantity;
//wallet
  Product({
    @required this.id,
    @required this.tittle,
    @required this.description,
     @required this.image,
     @required this.price,
      this.isfavourite=false,
     @required this.userId,
     @required this.isFeatured,this.quantity,this.reviews,this.rating
   // @required this. subServices,
  });
}
