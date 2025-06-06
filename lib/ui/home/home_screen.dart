import 'package:flutter/material.dart';
import 'package:imersao_mobile_alura/_util/widgets/app_bar.dart';
import 'package:imersao_mobile_alura/data/categories_data.dart';
import 'package:imersao_mobile_alura/data/restaurants_data.dart';
import 'package:imersao_mobile_alura/model/restaurant.dart';
import 'package:imersao_mobile_alura/ui/home/widgets/category_widget.dart';
import 'package:imersao_mobile_alura/ui/home/widgets/restaurant_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RestaurantsData restaurantsData = Provider.of<RestaurantsData>(context);
    return Scaffold(
      drawer: Drawer(),
      appBar: getAppBar(context: context),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 32,
            children: [
              Center(child: Image.asset("assets/logo.png", width: 147)),
              Text("Boas-vindas!"),
              TextFormField(),
              Text("Escolha por cartegoria"),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  spacing: 8,
                  children: List.generate(
                    CategoriesData.listCategories.length,
                    (index) {
                      return CategoryWidget(
                        category: CategoriesData.listCategories[index],
                      );
                    },
                  ),
                ),
              ),
              Image.asset("assets/banners/banner_promo.png"),
              Text("Bem avaliados"),
              Column(
                spacing: 16,
                children: List.generate(
                  restaurantsData.listRestaurants.length,
                  (index) {
                    Restaurant restaurant =
                        restaurantsData.listRestaurants[index];
                    return RestaurantWidget(restaurant: restaurant);
                  },
                ),
              ),
              SizedBox(height: 64),
            ],
          ),
        ),
      ),
    );
  }
}
