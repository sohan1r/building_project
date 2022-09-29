import 'package:building_project/menuSection/favorite.dart';
import 'package:building_project/menuSection/hotDeals.dart';
import 'package:building_project/menuSection/postRequirement.dart';
import 'package:building_project/menuSection/sellersNearby.dart';
import 'package:flutter/material.dart';
import '../menuSection/InteriorPages/interiorDesign.dart';
import '../menuSection/services.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);
  @override
  _drawerPageState createState() => _drawerPageState();
}

class _drawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: const Text("Builder Project"),
            accountEmail: const Text("builderProject@example.com"),
            currentAccountPicture: const CircleAvatar(),
            onDetailsPressed: () {},
          ),
          ListTile(
            leading: const Icon(Icons.favorite_border_outlined),
            title: const Text("Favorite"),
            trailing: const Text(
              "0",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => favoritePage(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(Icons.fireplace),
            title: const Text("Hot Deals"),
            trailing: const Text(
              "0",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HotDeals(),
                  ));
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.notes_outlined,
            ),
            title: const Text("Post your requirement"),
            trailing: const Text(
              "0",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PostRequirement()));
            },
          ),
          ListTile(
              leading: const Icon(Icons.design_services),
              title: const Text("Services"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Services()));
              }),
          ListTile(
            leading: const Icon(Icons.house_outlined),
            title: const Text("Interior Items"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InteriorDesign()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.sell),
            title: const Text("Sellers Nearby"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SellersNearby()));
            },
          ),
          const Divider(),
          const SizedBox(
            height: 0,
          ),
          const Text(
            "More items",
            textAlign: (TextAlign.center),
            style: TextStyle(fontSize: 20, color: Colors.greenAccent),
          ),
          ListTile(
            leading: const Icon(Icons.feedback_outlined),
            title: const Text("Feedback"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.format_quote,
            ),
            title: const Text("FAQ"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share App"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.abc_outlined),
            title: const Text("About us"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
