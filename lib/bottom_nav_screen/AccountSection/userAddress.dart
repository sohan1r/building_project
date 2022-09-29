import 'package:building_project/bottom_nav_screen/AccountSection/addAdress.dart';
import 'package:flutter/material.dart';

class userAddress extends StatefulWidget {
  const userAddress({Key? key}) : super(key: key);

  @override
  _userAddressState createState() => _userAddressState();
}

class _userAddressState extends State<userAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My addresses"),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 60),
                child: InputDecorator(
                  decoration: InputDecoration(
                    labelText: 'XP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text(
                    "No. of address",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                  ),
                ),

                // borderRadius:  BorderRadius.all(Radius.circular(5)),
                // border: Border.all(color: (Colors.black54), width: 2.0),
              ),
              Spacer(),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddAddress()));
                  },
                  child: const Text("Add new Address"),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
