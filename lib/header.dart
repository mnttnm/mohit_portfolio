import 'package:flutter/material.dart';
import 'package:mohit_portfolio/colors/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: primaryColor,
      toolbarHeight: 56,
      leading: const Text('mohit-tater'),
      title: Row(
        children: const [
          Text('_hello'),
          Text('_about_me'),
          Text('_projects'),
          Expanded(child: Text('_contact_me'))
        ],
      ),
    );
  }
}
