import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);
  @override
  _cartPageState createState() => _cartPageState();
}

class _cartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Cart"),
    );
  }
}
