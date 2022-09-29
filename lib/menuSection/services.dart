import 'package:building_project/menuSection/serviceTabScreens/buildingServices.dart';
import 'package:building_project/menuSection/serviceTabScreens/consultingServices.dart';
import 'package:building_project/menuSection/serviceTabScreens/contractingServices.dart';
import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  Services({Key? key}) : super(key: key);
  @override
  _servicesState createState() => _servicesState();
}

class _servicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
              title: const Text("Service Providers"),
              bottom: const TabBar(tabs: [
                Tab(text: 'Building\nServices'),
                Tab(
                  text: 'Consulting\nServices',
                ),
                Tab(
                  text: 'Contracting\nServices',
                ),
              ]),
            ),
            body: TabBarView(children: [
              BuildingServices(),
              ConsultingServices(),
              ContractingServices(),
            ])),
      ),
    );
  }
}
