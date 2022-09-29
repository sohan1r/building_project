import 'package:flutter/material.dart';

class PlaceOrderPage extends StatefulWidget {
  PlaceOrderPage({Key? key}) : super(key: key);
  @override
  _PlaceOrderPageState createState() => _PlaceOrderPageState();
}

class _PlaceOrderPageState extends State<PlaceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.zero,
                      child: Row(
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "Availability:",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 5),
                            child: const Text(
                              "In stock",
                              style: TextStyle(color: Colors.amberAccent),
                            ),
                          ),

                          // Container(
                          //   padding: EdgeInsets.only(),
                          //   child:const Text("Rs.38.5"),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
                // padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.4),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: const <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text("Rs.38.00"),
                    ),
                    Text(
                      'Rs.40.00',
                      style: TextStyle(
                          color: Colors.blueGrey,
                          decoration: TextDecoration.lineThrough),
                    ),
                    Text("(5%off)"),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: const Text(
                      "*Inclusive of all Taxes",
                      style: TextStyle(color: Colors.amberAccent),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    child: const Text(
                      "Enter Quantity",
                      style: TextStyle(color: Colors.black87),
                    ),
                  ),
                ],
              ),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //choose quantity
                    Card(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxHeight: 50,
                          minWidth: 140,
                          maxWidth: 160,
                        ),
                        child: TextField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "e.g.,2000",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ),

                    //Add to Cart button
                    Card(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxHeight: 60,
                          minWidth: 140,
                          maxWidth: 160,
                        ),
                        child: ListTile(
                          //visualDensity: const VisualDensity(horizontal: 0),
                          contentPadding: const EdgeInsets.only(right: 5),
                          title: Transform.translate(
                            offset: Offset(-20, 0),
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11),
                            ),
                          ),
                          // title: const Text(
                          //   "Add to Cart",
                          //   style: TextStyle(
                          //       color: Colors.black87,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 11),
                          // ),
                          // subtitle: Transform.translate(
                          //   offset: Offset(-20, 0),
                          //   // child: const Text(
                          //   //   "(Recommended Verified Suppliers to you)",
                          //   //   maxLines: 3,
                          //   //   style: TextStyle(
                          //   //       fontSize: 8,
                          //   //       color: Colors.black54,
                          //   //       fontWeight: FontWeight.bold),
                          //   // ),
                          // ),

                          leading: const Icon(Icons.person),
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   padding: EdgeInsets.zero,
              //   child: SizedBox(
              //     height: 40,
              //     child: ListView(
              //       scrollDirection: Axis.horizontal,
              //       children: [
              //         Container(
              //           padding: const EdgeInsets.only(left: 10),
              //           width: 160,
              //           height: 30,
              //           child: TextField(
              //             textAlignVertical: TextAlignVertical.bottom,
              //             style: const TextStyle(color: Colors.black),
              //             decoration: InputDecoration(
              //                 fillColor: Colors.grey.shade100,
              //                 filled: true,
              //                 hintText: "e.g.,2000",
              //                 hintMaxLines: 1,
              //                 labelStyle: const TextStyle(
              //                     fontSize: 12,
              //                     textBaseline: TextBaseline.alphabetic),
              //                 border: OutlineInputBorder(
              //                   borderRadius: BorderRadius.circular(10),
              //                 )),
              //           ),
              //         ),
              //         Container(
              //           padding: EdgeInsets.only(left: 10),
              //           width: 170,
              //           height: 40,
              //           child: ListTile(
              //             shape: RoundedRectangleBorder(
              //                 borderRadius: BorderRadius.circular(10)),
              //             tileColor: Colors.orangeAccent,
              //             title: const Text(
              //               "Add to Cart",
              //               style: TextStyle(
              //                   color: Colors.black87,
              //                   fontWeight: FontWeight.bold,
              //                   fontSize: 12),
              //             ),
              //             // subtitle: const Text(
              //             //   "(Recommended Verified Suppliers to you)",
              //             //   maxLines: 2,
              //             //   style: TextStyle(
              //             //       fontSize: 8,
              //             //       color: Colors.black54,
              //             //       fontWeight: FontWeight.bold),
              //             // ),
              //             leading: const Icon(Icons.shopping_cart),
              //             onTap: () {},
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              // Row(
              //   children: [
              //     Container(
              //       padding: const EdgeInsets.only(left: 10, top: 0),
              //       child: const Text(
              //         "Enter Quantity",
              //         style: TextStyle(color: Colors.black87),
              //       ),
              //     ),
              //   ],
              // ),
              // Container(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 8.0, right: 200),
              //     child: TextFormField(
              //       style: const TextStyle(color: Colors.black),
              //       decoration: InputDecoration(
              //           fillColor: Colors.grey.shade100,
              //           filled: true,
              //           hintText: "e.g.,2000",
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10),
              //           )),
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 8,
              // ),
              // Container(
              //   padding: const EdgeInsets.only(left: 10),
              //   child: SizedBox(
              //     height: 50,
              //     child: ListView(scrollDirection: Axis.horizontal, children: [
              //       Container(
              //         padding: EdgeInsets.zero,
              //         width: 170,
              //         height: 50,
              //         child: ListTile(

              //           title: const Text(
              //             "View Sellers",
              //             style: TextStyle(
              //                 color: Colors.black87,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 12),
              //           ),
              //           subtitle: const Text(
              //             "(Recommended Verified Suppliers to you)",
              //             maxLines: 2,
              //             style: TextStyle(
              //                 fontSize: 8,
              //                 color: Colors.black54,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //           leading: const Icon(Icons.person),
              //           onTap: () {},
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           tileColor: Colors.blueAccent,
              //         ),
              //       ),

              //       Spacer(),

              //       Container(
              //         padding: const EdgeInsets.only(),
              //         width: 170,
              //         height: 50,
              //         child: ListTile(
              //           title: const Text(
              //             "Enquire",
              //             style: TextStyle(
              //                 color: Colors.black87,
              //                 fontWeight: FontWeight.bold,
              //                 fontSize: 12),
              //           ),
              //           subtitle: const Text(
              //             "(Bulk enquiries & More information about product)",
              //             maxLines: 2,
              //             style: TextStyle(
              //                 fontSize: 8, fontWeight: FontWeight.bold),
              //           ),
              //           leading: const Icon(Icons.dock_outlined),
              //           shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(10)),
              //           tileColor: Colors.tealAccent,
              //           onTap: () {},
              //         ),
              //       ),

              //]),
              //),
              //),

              SingleChildScrollView(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Card(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxHeight: 50,
                          minWidth: 140,
                          maxWidth: 165,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 5),
                          title: Transform.translate(
                            offset: Offset(-20, 0),
                            child: const Text(
                              "View Sellers",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                          ),
                          // title: const Text(
                          //   "View Sellers",
                          //   style: TextStyle(
                          //       color: Colors.black87,
                          //       fontWeight: FontWeight.bold,
                          //       fontSize: 12),
                          // ),
                          subtitle: Transform.translate(
                            offset: Offset(-20, 0),
                            child: const Text(
                              "(Recommended Verified Suppliers to you)",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),

                          leading: const Icon(Icons.person),
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.blueAccent,
                        ),
                      ),
                    ),
                    const Spacer(),
                    Card(
                      child: Container(
                        constraints: const BoxConstraints(
                          minHeight: 50,
                          maxHeight: 50,
                          minWidth: 140,
                          maxWidth: 165,
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.only(right: 5),
                          title: Transform.translate(
                            offset: Offset(-20, 0),
                            child: const Text(
                              "Enquire",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                          ),
                          subtitle: Transform.translate(
                            offset: Offset(-20, 0),
                            child: const Text(
                              "(For Bulk enquiries and product information)",
                              maxLines: 2,
                              style: TextStyle(
                                  fontSize: 8,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          leading: const Icon(Icons.person),
                          onTap: () {},
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          tileColor: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              SingleChildScrollView(
                child: Row(),
              ),
              Container(
                  child: Material(
                color: Colors.brown,
                child: DefaultTabController(
                    length: 3,
                    child: TabBar(tabs: [
                      Tab(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                          child: const Text("Description"),
                        ),
                      ),
                      Tab(
                        child: Container(
                            constraints: BoxConstraints.expand(),
                            color: Colors.pinkAccent),
                      ),
                      Tab(
                        child: Container(
                          decoration:
                              BoxDecoration(border: Border.all(width: 1)),
                        ),
                      ),
                    ])),
              )),
            ]),
          ),
        ),
      ],
    ));
  }
}
