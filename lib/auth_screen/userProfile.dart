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
  List<UserProfile> model = [];
  Future<List<UserProfile>> fetchJson() async {
    model = [];

    var client = http.Client();
    Response response = await http.get(
      Uri.parse("http://sinoxtrading.in/pooja/api/user"),
    );

    if (response.statusCode == 200) {
      var urJson = jsonDecode(response.body);
      final data = urJson['user'];
      if (data != null) {
        model =
            List<UserProfile>.from(data.map((e) => UserProfile.fromJson(e)));
      }
    } else {
      print("Failed to load");
    }
    return model;
  }

  late Future<UserProfile> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchJson() as Future<UserProfile>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 50),
        child: FutureBuilder(
            future: fetchJson(),
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const Text('No data');
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              //  else {
              //   return ListView.builder(itemBuilder: (context, index) {});
              // }
              return const CircularProgressIndicator();
            }),
      ),
    );
  }
}

class UserProfile {
  int? id;
  String? name;
  Null? phone;
  String? email;
  Null? emailVerifiedAt;
  Null? twoFactorSecret;
  Null? twoFactorRecoveryCodes;
  Null? twoFactorConfirmedAt;
  String? createdAt;
  String? updatedAt;
  Null? username;
  Null? role;
  String? sellerId;

  UserProfile(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.emailVerifiedAt,
      this.twoFactorSecret,
      this.twoFactorRecoveryCodes,
      this.twoFactorConfirmedAt,
      this.createdAt,
      this.updatedAt,
      this.username,
      this.role,
      this.sellerId});

  UserProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    twoFactorSecret = json['two_factor_secret'];
    twoFactorRecoveryCodes = json['two_factor_recovery_codes'];
    twoFactorConfirmedAt = json['two_factor_confirmed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    username = json['username'];
    role = json['role'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['two_factor_secret'] = this.twoFactorSecret;
    data['two_factor_recovery_codes'] = this.twoFactorRecoveryCodes;
    data['two_factor_confirmed_at'] = this.twoFactorConfirmedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['username'] = this.username;
    data['role'] = this.role;
    data['seller_id'] = this.sellerId;
    return data;
  }
}
