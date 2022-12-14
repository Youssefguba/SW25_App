import 'package:ecommerce_app_sw25/screens/profile_screen.dart';
import 'package:ecommerce_app_sw25/themes/colors.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  // app colors
  // enum

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Account',
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(height: 20),
          _tileWidget(
            'Profile',
            Icons.person,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProfileScreen(),
                ),
              );
            },
          ),
          _tileWidget(
            'Orders',
            Icons.shopping_bag_outlined,
            onTap: () {},
          ),
          _tileWidget(
            'Address',
            Icons.location_on_outlined,
            onTap: () {},
          ),
          _tileWidget(
            'Payment',
            Icons.payment,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _tileWidget(
    String title,
    IconData icon, {
    VoidCallback? onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: AppColors.primaryColor,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: Color(0xff223263),
        ),
      ),
    );
  }
}
