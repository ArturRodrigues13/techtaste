import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:imersao_mobile_alura/model/restaurant.dart';

class RestaurantsData extends ChangeNotifier{
  List<Restaurant> listRestaurants = [];

  Future<void> getRestaurants() async {

    String jsonString = await rootBundle.loadString("assets/data.json");

    Map<String, dynamic> data = jsonDecode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurantData in restaurantsData) {
      Restaurant restaurant = Restaurant.fromMap(restaurantData);
      listRestaurants.add(restaurant);
    }
  }
}
