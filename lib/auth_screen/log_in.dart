import 'package:building_project/Screens/dashboard.dart';
import 'package:building_project/auth_screen/register.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  bool isLoading = false;
  var jsonResponse;
  Future Login(String emailController, passwordController) async {
    Map data = {
      'email': emailController,
      'password': passwordController,
    };
    print(data);
    String body = json.encode(data);
    var url = 'http://sinoxtrading.in/pooja/api/login';
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    print(response.body);
    print(response.statusCode);
    if (response.statusCode != 200 && body.isEmpty) {
      //Or put here your next screen using Navigator.push() method
      print("error");
    } else {
      print("success");
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Welcome",
                  style: TextStyle(color: Colors.black87, fontSize: 25),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.only(top: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Sign in to continue.",
                  style: TextStyle(color: Colors.black45, fontSize: 17),
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
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          controller: emailController,
                          style: const TextStyle(color: Colors.black),
                          validator: (value) {
                            RegExp regExp = RegExp(pattern);
                            if (emailController == null ||
                                !regExp.hasMatch(pattern)) {
                              return 'Enter a valid Email';
                            }
                            return null;
                          },
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
                          controller: passwordController,
                          validator: (value) {
                            if (passwordController == null) {
                              return 'Please Enter a valid password';
                            }
                          },
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
                        ElevatedButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(250, 40)),
                          onPressed: () {
                            setState(() {
                              isLoading = true;
                              Login(emailController.text.toString(),
                                  passwordController.text.toString());
                              setState(() {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const Dashboard(),
                                    ));
                              });
                            });
                          },
                          child: const Text(
                            'Login',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Card(
                          color: Colors.greenAccent,
                          elevation: 2.0,
                          child: ListTile(
                            onTap: () {},
                            leading: const CircleAvatar(
                              backgroundColor: Colors.blueAccent,
                            ),
                            title: const Text(
                              "Sign in With google",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Card(
                          color: Colors.greenAccent,
                          elevation: 2.0,
                          child: ListTile(
                            onTap: () {},
                            leading: const CircleAvatar(
                                backgroundColor: Colors.blueAccent),
                            title: const Text(
                              "Sign in with Facebook",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have account?",
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const MyRegister()));
                              },
                              child: const Text(
                                "Create one",
                                style: TextStyle(
                                    fontSize: 13, color: Colors.blueAccent),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
