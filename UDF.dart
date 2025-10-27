import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/product_detail_screen.dart';
import 'models/product.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatefulWidget {
  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  final List<Product> _cart = [];

  void _addToCart(Product product) {
    setState(() {
      _cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter eCommerce',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(onAddToCart: _addToCart),
      routes: {
        CartScreen.routeName: (ctx) => CartScreen(cartItems: _cart),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(onAddToCart: _addToCart),
      },
    );
  }
}
