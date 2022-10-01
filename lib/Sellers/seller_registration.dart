import 'package:building_project/Screens/dashboard.dart';
import 'package:building_project/bottom_nav_screen/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class SellerRegistration extends StatefulWidget {
  const SellerRegistration({Key? key}) : super(key: key);

  @override
  _sellerRegistrationState createState() => _sellerRegistrationState();
}

class _sellerRegistrationState extends State<SellerRegistration> {
  TextEditingController company = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController additional = TextEditingController();
  TextEditingController mobile = TextEditingController();

  SellerRegistrationHere(
      String company, contact, email, additional, mobile) async {
    Map data = {
      'Company': company,
      'Mobile': mobile,
      'Contact': contact,
      'Email': email,
      'Additional': additional,
    };
    print(data);
    String body = json.encode(data);
    Response response = await http.post(
      Uri.parse("http://bricksmart.in/api/Seller"),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );
    var urJson = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${urJson['success']}")));
      setState(() {});
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${urJson['error']}")));
      return;
    }
  }

  // Future<FutureOr> SellerRegistrationHere(String email, String company,
  //     String contact, String additional, String mobile) async {
  //   final Map<String, dynamic> data = {
  //     'Email': email,
  //     'Company': company,
  //     'Additional': additional,
  //     'Contact': contact,
  //     'Mobile': mobile
  //   };
  //   _registeredInStatus = Status.Registering;

  //   return await post(Uri.parse("http://bricksmart.in/api/Seller"),
  //           body: json.encode(data),
  //           headers: {'Content-Type': 'application/json'})
  //       .then(onValue)
  //       .catchError(data);
  // }

  // static Future<FutureOr> onValue(Response response) async {
  //   var result;
  //   final Map<String, dynamic> responseData = json.decode(response.body);

  //   if (response.statusCode == 200) {
  //     var userData = responseData['success'];

  //     User authUser = User.fromJson(userData);

  //     UserPreferences().saveUser(authUser);
  //     result = {
  //       'status': true,
  //       'message': 'Successfully registered',
  //       'data': authUser
  //     };
  //   } else {
  //     result = {
  //       'status': false,
  //       'message': 'Registration failed',
  //       'data': responseData
  //     };
  //   }

  //   return result;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Sellers"),
      ),
      body: Stack(
        children: [
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.only(
                top: 50,
                // top: MediaQuery.of(context).size.height * 0.3
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    // padding: const EdgeInsets.only(
                    //   top: 60,
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Welcome Seller",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Sign up to continue",
                          style: TextStyle(fontSize: 17, color: Colors.black87),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: company,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Company Name",
                              prefixIcon: const Icon(Icons.factory),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: contact,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Contact",
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //Email section--------------------------------------
                        TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "E-mail",
                              prefixIcon: const Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: additional,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Additional",
                              prefixIcon: const Icon(Icons.add),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        // Password section--------------------------------
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: mobile,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Mobile",
                              prefixIcon:
                                  const Icon(Icons.mobile_friendly_outlined),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(250, 40)),
                          onPressed: () {
                            SellerRegistrationHere(
                                company.text.toString(),
                                contact.text.toString(),
                                email.text.toString(),
                                additional.text.toString(),
                                mobile.text.toString());
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Dashboard()));
                          },
                          child: const Text(
                            'Sign up',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// class User {
//   String Email;
//   String Contact;
//   String Mobile;
//   String Additional;
//   String Company;

//   User(
//       {required this.Email,
//       required this.Contact,
//       required this.Company,
//       required this.Mobile,
//       required this.Additional});

//   factory User.fromJson(Map<String, dynamic> responseData) {
//     return User(
//       Email: responseData['Email'],
//       Contact: responseData['Contact'],
//       Company: responseData['Company'],
//       Mobile: responseData['Mobile'],
//       Additional: responseData['Addtional'],
//     );
//   }
// }
// class UserPreferences {
//   Future<bool> saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

    
//     prefs.setString("Contact", user.Contact);
//     prefs.setString("Mobile", user.Mobile);
//     prefs.setString("Additional", user.Additional);
//     prefs.setString("Company", user.Company);
//     prefs.setString("Email", user.Email);

//     return prefs.commit();
//   }

//   Future<User> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     String? Email = prefs.getString("Email");
//     String? Mobile = prefs.getString("Contact");
//     String? Additional = prefs.getString("Additional");
//     String? Contact = prefs.getString("Contact");
//     String? Company = prefs.getString("Company");

//     return User(
//         Email:Email,
//         Company: Company,
//         Contact: Contact,
//         Mobile: Mobile,
//         Additional: Additional,
        
//   }

//   void removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     prefs.remove("name");
//     prefs.remove("email");
//     prefs.remove("phone");
//     prefs.remove("type");
//     prefs.remove("token");
//   }

//   Future<String?> getToken(args) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString("success");
//     return token;
//   }
// }
