import 'package:flutter/material.dart';


class ImageIdx{
  Image image;
  int idx;
  late bool isSelected;

  ImageIdx({required this.image, required this.idx}){
    isSelected=false;
  }
}