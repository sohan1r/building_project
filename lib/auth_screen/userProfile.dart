import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:async';
import 'dart:convert';

import 'package:snapshot/snapshot.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  // final List<Map> myProducts =
  //     List.generate(100000, (index) => {"id": index, "name": "Product $index"})
  //         .toList();

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final List<ProfileModel> model = [];
  Future<List<ProfileModel>> fetchJson() async {
    Response response = await http.post(
      Uri.parse("http://sinoxtrading.in/pooja/api/user"),
    );

    if (response.statusCode == 200) {
      var urJson = jsonDecode(response.body);
      for (var jsondata in urJson) {
        model.add(ProfileModel.fromJson(jsondata));
      }
    } else {
      print("error");
    }
    return model;
  }

  late Future<ProfileModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchJson() as Future<ProfileModel>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: FutureBuilder(
            future: fetchJson(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('${snapshot.data}');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
    //return Scaffold(
    // child: Container(
    //   width: MediaQuery.of(context).size.width,
    //   child: Column(
    //     children: [
    //       FutureBuilder(
    //         future: Provider.of(context).auth.getCurrentUser(),
    //         builder: (context, snapshot) {
    //           if (snapshot.connectionState == ConnectionState.done) {
    //             return displayUserInformation(context, snapshot);
    //           } else {
    //             return const CircularProgressIndicator();
    //           }
    //         },
    //       )
    //     ],
    //   ),
    // ),
    //   appBar: AppBar(title: const Text("Profile")),
    //   body: ListView(children: [
    //     Padding(
    //       padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    //       child: TextFormField(
    //         controller: nameController,
    //         style: const TextStyle(color: Colors.black),
    //         decoration: InputDecoration(

    //             fillColor: Colors.grey.shade100,
    //             filled: true,
    //             hintText: 'Name',
    //             enabled: false,
    //             prefixIcon: const Icon(Icons.person),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             )),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(top: 100, left: 10, right: 10),
    //       child: TextFormField(
    //         controller: phoneController,
    //         style: const TextStyle(color: Colors.black),
    //         decoration: InputDecoration(
    //             fillColor: Colors.grey.shade100,
    //             filled: true,
    //             hintText: "Name",
    //             enabled: false,
    //             prefixIcon: const Icon(Icons.phone),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             )),
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
    //       child: TextFormField(
    //         controller: emailController,
    //         style: const TextStyle(color: Colors.black),
    //         decoration: InputDecoration(
    //             fillColor: Colors.grey.shade100,
    //             filled: true,
    //             hintText: "Name",
    //             enabled: false,
    //             prefixIcon: const Icon(Icons.email),
    //             border: OutlineInputBorder(
    //               borderRadius: BorderRadius.circular(10),
    //             )),
    //       ),
    //     )
    //   ]),
    //   // body: Stack(
    //   //   children: [
    //   //     Padding(
    //   //       padding: EdgeInsets.only(top: 150),
    //   //       child: Column(
    //   //         children: const [
    //   //           Padding(
    //   //             padding: EdgeInsets.only(top: 0),
    //   //           )
    //   //         ],
    //   //       ),
    //   //     ),
    //   //   ],
    //   // ),
    // );
  }

  // Widget displayUserInformation(
  //     BuildContext context, AsyncSnapshot<Object?> snapshot) {
  //   final user = snapshot.data;
  //   return Column(
  //     children: [
  //       Padding(padding: EdgeInsets.only(top:20),
  //        child: Text("Name: ${user?.name ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
  //       ),
  //       Padding(padding: EdgeInsets.only(top:10),
  //        child: Text("Phone: ${user.phone ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
  //       ),
  //       Padding(padding: EdgeInsets.only(top: 20),
  //        child: Text("Email: ${user.email ?? 'Anonymous'}", style: TextStyle(fontSize: 20),),
  //       ),

  //     ],
  //   );
  // }
}

// Future getDataFromDatabase(BuildContext context) {
//   FutureBuilder
// }
class ProfileModel {
  Error? error;

  ProfileModel({this.error});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    error = json['error'] != null ? new Error.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.error != null) {
      data['error'] = this.error!.toJson();
    }
    return data;
  }
}

class Error {
  List<String>? id;

  Error({this.id});

  Error.fromJson(Map<String, dynamic> json) {
    id = json['id'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    return data;
  }
}

// class ProfileModel {
  
//   final int id;
  

//   const ProfileModel({
    
//     required this.id,
  
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
      
//       id: json['id'],
    
//     );
//   }
// }