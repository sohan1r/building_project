import 'package:building_project/bottom_nav_screen/AccountSection/location.dart';
import 'package:building_project/bottom_nav_screen/AccountSection/userAddress.dart';
import 'package:building_project/Screens/searchPage.dart';
import 'package:building_project/Sellers/seller_type.dart';
import 'package:building_project/auth_screen/userProfile.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);
  @override
  _accountPageState createState() => _accountPageState();
}

class _accountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: const EdgeInsets.only(top: 20), children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MyProfile()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.location_on),
          title: const Text(" Your Location"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Location()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.delivery_dining_outlined),
          title: const Text("Delivery address"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const userAddress()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.shopping_bag),
          title: const Text("My orders"),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text("Become a Seller"),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SellerType()));
          },
        ),
      ]),
    );
  }
}
