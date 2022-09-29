import 'package:build_context/build_context.dart';
import 'package:building_project/bottom_nav_screen/materialPage.dart';
import 'package:building_project/menuSection/InteriorPages/interiorDesignItems.dart';
import 'package:flutter/Material.dart';

class InteriorDesign extends StatefulWidget {
  @override
  _interiorDesignState createState() => _interiorDesignState();
}

class _interiorDesignState extends State<InteriorDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interior Product"),
      ),
      body: Stack(children: [
        Container(
          padding: EdgeInsets.zero,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (Orientation == Orientation.portrait) ? 2 : 2,
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7),
              itemBuilder: (BuildContext context, int index) {
                // return
                // Card(
                //   child: GridTile(
                //       footer: const Text("Name"),
                //      // child: Text(data[index]['image'])
                //      child: Text('Image'),

                //       ),
                // );
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => InteriorDesignItems())));

                      Container(
                        child: const Text("data"),
                      );
                    },
                  ),
                );
              }),
        )
      ]),
    );

    // return Scaffold(
    //   appBar: AppBar(),
    //   body: Stack(children: [
    //     Container(
    //       child: const Text("Interior Design Api here"),
    //     ),
    //   ]),
    // );
  }
}
