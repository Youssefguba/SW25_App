import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_sw25/models/category_model.dart';
import 'package:ecommerce_app_sw25/models/category_repo_model.dart';
import 'package:ecommerce_app_sw25/models/product_model.dart';
import 'package:ecommerce_app_sw25/repository/category_repo.dart';
import 'package:flutter/material.dart';

import '../repository/product_repository.dart';
import 'favourite_screen.dart';

// TODO Font family
// TODO Colors File

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
          // FutureBuilder<List<CategoryRepoModel>>(
          //   future: CategoryRepo().getAllCategories(),
          //   builder: (context, snapshot) {
          //     final categoryList = snapshot.data!;
          //
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Container(
          //           height: 100,
          //           child: Center(child: CircularProgressIndicator()));
          //     }
          //
          //     if (snapshot.connectionState == ConnectionState.done) {
          //       return Container(
          //         height: 100,
          //         child: ListView.builder(
          //           scrollDirection: Axis.horizontal,
          //           itemCount: categoryList.length,
          //           itemBuilder: (context, index) {
          //             return Container(
          //               padding: EdgeInsets.symmetric(horizontal: 8),
          //               child: Column(
          //                 children: [
          //                   CircleAvatar(
          //                     child: Image.network(categoryList[index].image),
          //                   ),
          //                   Text(categoryList[index].name),
          //                 ],
          //               ),
          //             );
          //           },
          //         ),
          //       );
          //     }
          //
          //     return Text('Try Again Later!');
          //   },
          // ),

          FutureBuilder<List<Product>>(
            future: ProductRepository().getAllProducts(),
            builder: (context, snapshot) {
              final listOfProducts = snapshot.data;

              // enum - enumeration
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                    height: 50,
                    child: CircularProgressIndicator(),
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                return GridView.builder(
                  itemCount: listOfProducts!.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final priceAfterDiscount = listOfProducts[index].price -
                        (listOfProducts[index].price *
                            (listOfProducts[index].discountPercentage / 100));

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 12),
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            listOfProducts[index].thumbnail,
                            height: 150,
                            width: 250,
                          ),
                          Text(
                            listOfProducts[index].title,
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xff40BFFF),
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // Rating Bar
                          SizedBox(height: 10),
                          Text("\$ ${priceAfterDiscount.ceil().toString()}"),

                          Row(
                            children: [
                              Text('\$ ${listOfProducts[index].price}'),
                              SizedBox(width: 8),
                              Text(
                                '${listOfProducts[index].discountPercentage}% Off',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 80,
                    crossAxisSpacing: 30,
                    childAspectRatio: 0.7,
                  ),
                );
              }

              return Text('Try Again Later!');
            },
          ),
        ],
      ),
    );
  }
}
