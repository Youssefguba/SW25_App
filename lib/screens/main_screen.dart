import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_sw25/models/category_model.dart';
import 'package:ecommerce_app_sw25/models/category_repo_model.dart';
import 'package:ecommerce_app_sw25/repository/category_repo.dart';
import 'package:flutter/material.dart';

import 'favourite_screen.dart';

class MainScreen extends StatelessWidget {
  List<String> listOfImages = [
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
  ];

  List<CategoryModel> listOfCategories = [
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
    CategoryModel(
        image: "assets/images/shirt.png", title: "Man Cloths", inStock: true),
  ];

  List<Color> listOfColors = [
    Colors.red,
    Colors.blue,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          // Search Bar - Wishlist Item - Notification
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Product",
                    ),
                  ),
                ),
                SizedBox(width: 12),
                IconButton(
                  icon: Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return FavouriteScreen();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(width: 12),
                Icon(Icons.notifications_none),
              ],
            ),
          ),

          // Slider
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
            ),
            items: listOfImages.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Image.asset(i),
                  );
                },
              );
            }).toList(),
          ),

          // Title of Category
          Row(),

          SizedBox(height: 20),

          // List of Categories
          FutureBuilder<List<CategoryRepoModel>>(
            future: CategoryRepo().getAllCategories(),
            builder: (context, snapshot) {
              final categoryList = snapshot.data!;

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()));
              }

              if(snapshot.connectionState == ConnectionState.done) {
                return Container(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: [
                            CircleAvatar(
                              child: Image.network(categoryList[index].image),
                            ),
                            Text(categoryList[index].name),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }

              return Text('Try Again Later!');
            },
          ),

          GridView.builder(
            itemCount: listOfCategories.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    CircleAvatar(
                      child: Image.asset(listOfCategories[index].image),
                      backgroundColor: listOfCategories[index].inStock
                          ? Colors.orange
                          : Colors.red,
                    ),
                    Text(listOfCategories[index].title),
                  ],
                ),
              );
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 80,
              crossAxisSpacing: 30,
              childAspectRatio: 1,
            ),
          ),
        ],
      ),
    );
  }
}
