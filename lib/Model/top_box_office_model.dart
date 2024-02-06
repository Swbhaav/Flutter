
import 'package:flutter/material.dart';

class TopBoxOfficeModel{
  IconData? icon;
  String? title;
  double? revenue;

  TopBoxOfficeModel({this.icon, this.title, this.revenue});


}
final List<TopBoxOfficeModel> topBoxOfficeList=[
  TopBoxOfficeModel(icon: Icons.star,title: "The Beekeeper", revenue: 5.3),
  TopBoxOfficeModel(icon: Icons.star,title: "Wonka", revenue: 4.7),
  TopBoxOfficeModel(icon: Icons.star,title: "Migration", revenue: 4.2),
  TopBoxOfficeModel(icon: Icons.star,title: "Mean Girl's",revenue: 3.8)
];




