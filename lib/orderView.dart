import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Order extends StatefulWidget {
  Order({Key? key}) : super(key: key);
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.zero,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Availability",
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: const Text("In stock"),
                ),
              ],
            ),
            // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
          ),
          Container(),
          Container(),
        ]),
      ),
    );
  }
}
