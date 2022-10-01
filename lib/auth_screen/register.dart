import 'package:http/http.dart';
import 'dart:async';
import 'package:building_project/Screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  Future<void> _registration(String name, email, contact, pass) async {
    var jsonResponse;
    Map data = {
      'name': name,
      'email': email,
      'phone': contact,
      'password': pass,
    };
    print(data);

    String body = json.encode(data);

    Response response = await http.post(
      Uri.parse('http://sinoxtrading.in/pooja/api/register'),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
      },
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${jsonResponse['user']}")));

      //Or put here your next screen using Navigator.push() method
      print('success');
      setState(() {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Dashboard()));
      });
      print(data['token']);
    } else {
      print('error');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(" ${jsonResponse['error']}")));
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.only(top: 100),
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
          const SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Name",
                              prefixIcon: const Icon(Icons.person),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        //Email section--------------------------------------

                        TextFormField(
                          controller: emailController,
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
                          controller: phoneController,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Phone",
                              prefixIcon: const Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        // Password section--------------------------------
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: passwordController,
                          style: const TextStyle(color: Colors.black),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              prefixIcon: const Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        //Confirm Password-------------------------------------

                        TextFormField(
                          controller: confirmPassword,
                          style: TextStyle(color: Colors.black),
                          obscureText: true,
                          validator: (val) {
                            if (val != confirmPassword) {
                              print("Password Did not match");
                              return;
                            }
                          },
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Confirm Password",
                              prefixIcon: const Icon(Icons.password_rounded),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),

                        ElevatedButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(250, 40)),
                          onPressed: () {
                            _registration(
                              nameController.text.toString(),
                              emailController.text.toString(),
                              phoneController.text.toString(),
                              passwordController.text.toString(),
                            );
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
