import 'package:flutter/material.dart';

class CatergoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CatergoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CatergoryModel> getCatergories() {
    List<CatergoryModel> catergories = [];

    catergories.add(CatergoryModel(
        name: "Salad",
        iconPath: 'assests/icons/honey-pancakes.svg',
        boxColor: const Color(0xff92A3FD)));
    catergories.add(CatergoryModel(
        name: "Cake",
        iconPath: 'assests/icons/pancakes.svg',
        boxColor: const Color.fromARGB(255, 146, 253, 169)));

    catergories.add(CatergoryModel(
        name: "Pie",
        iconPath: 'assests/icons/pie.svg',
        boxColor: const Color.fromARGB(255, 196, 146, 253)));

    return catergories; // Add this line
  }
}
