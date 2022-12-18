import 'package:ecommerce_app_sw25/cubits/cart_cubit/cart_cubit.dart';
import 'package:ecommerce_app_sw25/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app_sw25/models/cart_model.dart';
import 'package:ecommerce_app_sw25/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CartCubit>().getMyCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is GetMyCartSuccessful) {
            final cart = state.cart;
            return _bodyWidget(cart);
          }
          if (state is LoadingCart) {
            return Center(child: CircularProgressIndicator());
          }

          return Center(
              child: Text(
            'Try Again!',
            style: TextStyle(color: Colors.black),
          ));
        },
      ),
    );
  }

  Widget _bodyWidget(CartModel cart) {
    return ListView(
      children: [
        _cartItem(cart),
        _cuoponWidget(),
        _receitWidget(cart),
        _buttonWidget(),
      ],
    );
  }

  Widget _cartItem(CartModel cart) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: cart.products.length,
      itemBuilder: (context, index) {
        final product = cart.products[index];
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.all(8),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ListTile(
                  leading: Image.network(
                      'https://m.media-amazon.com/images/I/71GiRZs0SBL._AC_SX695_.jpg'),
                  title: Text(product.title),
                  subtitle: Text(
                    '\$ ${product.price}',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.favorite_border_outlined),
                        SizedBox(width: 7),
                        Icon(Icons.delete_outline_outlined),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            context.read<ProductCubit>().getSingleProduct(product.id);

                              setState(() {
                                product.quantity -= 1;
                              });


                          },
                        ),
                        Text('${product.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            context.read<ProductCubit>().getSingleProduct(product.id);
                            final stock = context.read<ProductCubit>().myProduct!.stock;

                            print('this is product stock $stock');
                            if(product.quantity < stock) {
                              setState(() {
                                product.quantity += 1;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _cuoponWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Cuopon',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
              ),
            ),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(MediaQuery.of(context).size.width * 0.2, 60),
            primary: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
          onPressed: () {},
          child: Text('Apply'),
        ),
      ],
    );
  }

  Widget _receitWidget(CartModel cart) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: [
          _receitItemWidget('items', cart.totalProducts.toString()),
          SizedBox(height: 10),
          _receitItemWidget('discount', '\$ ${cart.discountedTotal}'),
          SizedBox(height: 10),
          _receitItemWidget('quantity', '\$ ${cart.totalQuantity}'),
          SizedBox(height: 20),
          Container(
            height: 1,
            child: ListView.builder(
              itemCount: 50,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  height: 2,
                  width: 3,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  color: Colors.red,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          _receitItemWidget('total price', '\$ ${cart.total}'),
        ],
      ),
    );
  }

  Row _receitItemWidget(String title, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        Text(
          price,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buttonWidget() {
    return Container(
      margin: EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () {},
        child: Text('Checkout'),
      ),
    );
  }
}
