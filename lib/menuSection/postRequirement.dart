import 'package:flutter/material.dart';

class PostRequirement extends StatefulWidget {
  const PostRequirement({Key? key}) : super(key: key);

  @override
  _PostRequirementState createState() => _PostRequirementState();
}

class _PostRequirementState extends State<PostRequirement> {
  late String _chosenValue;
  //  String dropdownvalue = '<-Select->';

  // // List of items in our dropdown menu
  var items = [
    'Bags',
    'Cubic feet',
    'Litres',
    'Meters',
    'Pieces',
    'Sheets',
    'Square feet',
    'Tons',
    'Others'
  ];
  // late String _productName;
  // late String _quantity;
  // late String _unit;
  // static const List<String> list = <String>['Sheet', 'Bags', 'Cubic feet', 'Litres','Meters','Pieces','Sheets','Square feet','Tons'];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Widget _ProductName() {
  //   return TextFormField(
  //     decoration:const InputDecoration(labelText: 'Product Name'),

  //     validator: ( value) {
  //       if (value!.isEmpty) {
  //         return 'Product Name is Required';
  //       }

  //       return null;
  //    },
  //    onSaved: ( value) {
  //       _productName = value!;
  //     },
  //   );
  // }
  //  Widget _Quantity() {
  //   return TextFormField(
  //     decoration:const InputDecoration(labelText: 'Quantity'),

  //    validator: ( value) {
  //       if (value!.isEmpty) {
  //         return 'Quantity is Required';
  //       }

  //       return null;
  //    },
  //    onSaved: ( value) {
  //       _productName = value!;
  //     },
  //   );
  // }
  //  Widget _Unit() {
  //   return TextFormField(
  //     decoration: InputDecoration(labelText: 'Name'),
  //     maxLength: 10,
  //    validator: ( value) {
  //       if (value!.isEmpty) {
  //         return 'Unit is Required';
  //       }

  //       return DropdownButton<String>(items:<String>[list].map((String value){
  //         return DropdownMenuItem(
  //           value: value,
  //           child: Text(value)
  //       }).toList(),
  //       onChanged: onChanged(){});
  //    },
  //    onSaved: ( value) {
  //       _productName = value!;
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("What are you Looking for?"),
      ),
      body: Stack(
        children: [
          //   SingleChildScrollView(
          //     child: Container(
          //       padding: EdgeInsets.only(
          //           top: MediaQuery.of(context).size.height * 0.3),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           Container(
          //             margin: const EdgeInsets.only(left: 35, right: 35),
          //             child: Column(
          //               children: [
          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "Full Name",
          //                       prefixIcon: const Icon(Icons.person),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 //Email section--------------------------------------
          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "Enterprise Name",
          //                       prefixIcon: const Icon(Icons.person),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "E-mail",
          //                       prefixIcon: const Icon(Icons.email),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),

          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "Phone",
          //                       prefixIcon: const Icon(Icons.phone),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 // Password section--------------------------------
          //                 const SizedBox(
          //                   height: 30,
          //                 ),
          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   obscureText: true,
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "Password",
          //                       prefixIcon: const Icon(Icons.password_rounded),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 const SizedBox(
          //                   height: 30,
          //                 ),

          //                 //Confirm Password-------------------------------------

          //                 TextFormField(
          //                   style: const TextStyle(color: Colors.black),
          //                   obscureText: true,
          //                   decoration: InputDecoration(
          //                       fillColor: Colors.grey.shade100,
          //                       filled: true,
          //                       hintText: "Confirm Password",
          //                       prefixIcon: const Icon(Icons.password_rounded),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(10),
          //                       )),
          //                 ),
          //                 const SizedBox(
          //                   height: 40,
          //                 ),

          //                 ElevatedButton(
          //                   style:
          //                       TextButton.styleFrom(minimumSize: Size(250, 40)),
          //                   onPressed: () {},
          //                   child: const Text(
          //                     'Sign up',
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   )

          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Post your Requirement here",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Product name',
                                border: OutlineInputBorder()),
                            validator: ((value) {
                              if (value == null || value.isEmpty) {
                                return 'Product Name is Required';
                              }
                              return null;
                            }),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Quantity',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Quantity is Required';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextFormField(
                            decoration: const InputDecoration(
                                labelText: 'Unit',
                                border: OutlineInputBorder()),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Unit is Required';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          const TextField(
                            decoration: InputDecoration(
                                labelText: 'Enter Message',
                                border: OutlineInputBorder()),
                            maxLength: 260,
                            minLines: 1,
                            maxLines: 7,
                          ),
                          ElevatedButton(
                              style: TextButton.styleFrom(
                                  minimumSize: const Size(150, 40)),
                              onPressed: () {},
                              child: const Text("Post Requirement"))
                        ],
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
