import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app_sw25/cubits/category_cubit/category_cubit.dart';
import 'package:ecommerce_app_sw25/cubits/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
       if(state is GetProductSuccess) {
         final product = state.product;
         return Scaffold(
           appBar: AppBar(
             title: Text(product.title),
           ),
           body: ListView(
             children: [
               _sliderWidget(product.images),

               _indicatorWidget(),

               _titleWidget(),

               _ratingWidget(),

               _priceWidget(),

               _productSizeWidget(),

               _productColorWidget(),

               _descriptionWidget(),
             ],
           ),
         );
       }
       if(state is LoadingProduct) {
         return Scaffold(body: Center(child: CircularProgressIndicator()));
       }

       return Scaffold(body: Center(child: Text('Try Again!')),);
      },
    );
  }

  Widget _sliderWidget(List listOfImages) {

    return CarouselSlider(
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
              child: Image.network(i),
            );
          },
        );
      }).toList(),
    );
  }


  Widget _indicatorWidget() {
    return Container();
  }


  Widget _titleWidget() {
    return Container();
  }


  Widget _ratingWidget() {
    return Container();
  }


  Widget _priceWidget() {
    return Container();
  }


  Widget _productSizeWidget() {
    return Container();
  }


  Widget _productColorWidget() {
    return Container();
  }


  Widget _descriptionWidget() {
    return Container();
  }
}
