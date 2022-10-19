import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {

  List<String> listOfImages = [
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
    'assets/images/promotion_image.png',
  ];

  List listOfCategory = [
    {'icon': "assets/images/shirt.png", 'text':"Man Shirt"},
    {'icon': "assets/images/shirt.png", 'text':"Dress"},
    {'icon': "assets/images/shirt.png", 'text':"Man Work Equipment"},
    {'icon': "assets/images/shirt.png", 'text':"Man Work Equipment"},
    {'icon': "assets/images/shirt.png", 'text':"Man Equipment"},
    {'icon': "assets/images/shirt.png", 'text':"Woman Bag"},
    {'icon': "assets/images/shirt.png", 'text':"Man Shoes"},
  ];


  @override
  Widget build(BuildContext context) {
    print(listOfCategory[2]);
    return Scaffold(
      body: SafeArea(
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
                  Icon(Icons.favorite_border_outlined),
                  SizedBox(width: 12),
                  Icon(Icons.notifications_none),
                ],
              ),
            ),

            // Slider
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: <String>[
                'assets/images/promotion_image.png',
                'assets/images/promotion_image.png',
                'assets/images/promotion_image.png',
                'assets/images/promotion_image.png',
              ].map((i) {
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
            Container(
              height: 100,
              child: ListView.builder(
                  itemCount: listOfCategory.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                      children: [
                        Image.asset(listOfCategory[index]['icon']),
                        Text(listOfCategory[index]['text']),
                      ],
                      ),
                    );
                  }),
            ),

            // Title of Flash Sale
            Row(),

            // List of Flash Sale
            // ListView(),

            // Offers
            Container(),

            // Grid of Products
            Container(),
          ],
        ),
      ),
    );
  }
}
