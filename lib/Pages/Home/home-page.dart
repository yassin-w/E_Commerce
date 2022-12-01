// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, unused_import, prefer_const_literals_to_create_immutables, file_names
import 'dart:io';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:e_commerce/Pages/products/add-product-page.dart';
import 'package:e_commerce/Pages/products/product-list-page.dart';
import 'package:e_commerce/Pages/splash/spalsh-page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    ProductList(),
    AddProductPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: ConvexAppBar(
          height: 60,
          initialActiveIndex: _selectedIndex,
          items: [
            TabItem(icon: Icons.home, title: 'Home'),
            TabItem(icon: Icons.add, title: 'Add'),
          ],
          onTap: (int i) => _onItemTap(i),
        ));
  }
}
