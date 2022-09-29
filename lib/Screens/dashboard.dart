import 'package:building_project/Screens/searchPage.dart';
import 'package:building_project/bottom_nav_screen/cart.dart';
import 'package:building_project/bottom_nav_screen/home.dart';
import 'package:building_project/bottom_nav_screen/materialPage.dart';
import 'package:building_project/bottom_nav_screen/account.dart';
import 'package:flutter/material.dart';
import 'package:building_project/drawerItems/drawerWidget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<Dashboard> {
  int currentIndex = 0;

  List pages = [
    const HomePage(),
    const MaterialCategory(),
    const CartPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      appBar: AppBar(
        title: const Text("Building project"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SearchPage()));
            },
            icon: const Icon(Icons.search),
            tooltip: 'Search',
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notification_important_outlined),
            tooltip: 'Notification',
          )
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() {
                currentIndex = index;
              }),
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.blueGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.apartment_outlined), label: "Material"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account")
          ]),
    );
  }
}
