import 'package:flutter/material.dart';

import '../themes/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(''),
            ),
            title: Text('Name'),
          ),
          _tileWidget(
            'Gender',
            Icons.male_outlined,
            onTap: () {},
          ),
          _tileWidget(
            'Email',
            Icons.email_outlined,
            onTap: () {},
          ),
          _tileWidget(
            'Phone',
            Icons.phone,
            onTap: () {},
          ),
          _tileWidget(
            'Birthday',
            Icons.calendar_month,
            onTap: () {},
          ),
          _tileWidget(
            'Change Password',
            Icons.lock_outline_rounded,
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
      trailing: Icon(Icons.arrow_forward_ios_rounded),
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
