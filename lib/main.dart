import 'package:flutter/material.dart';
import 'package:food_delivery/pages/food/popular_food_detail.dart';
import 'package:food_delivery/pages/home/recommend_food_detail.dart';
import 'package:get/route_manager.dart';

import 'pages/home/main_food_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const RecommendFoodDetail());
  }
}
