import 'package:flutter/material.dart';

class SellersNearbyPage extends StatefulWidget {
  @override
  _SellersNearbyPageState createState() => _SellersNearbyPageState();
}

class _SellersNearbyPageState extends State<SellersNearbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: FutureBuilder<List>(
              //future: fetchCategory(),
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  // (Orientation == Orientation.portrait) ? 3 : 2,
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                ),
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  var name = snapshot.data![index].name;
                  var image = snapshot.data![index].img;
                  return Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 11, 12, 15)),
                    child: Card(
                      elevation: 4,
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    //"https://cdn.vox-cdn.com/thumbor/TmgXcq6_4URVd0YN0SotUf5WYeA=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/9556001/chicks.0.0.0.jpg",
                                    image),
                                fit: BoxFit.cover,
                                alignment: Alignment.center),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.3),
                            child: Text(
                              name,
                              textAlign: TextAlign.center,
                            ),
                            //child: Image.network(snapshot.data![index].img),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
        )
      ]),
    );
  }
}
