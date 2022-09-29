import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<ResetPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50),
              child: const Text(
                "Reset PassWord",
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
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
                          height: 20,
                        ),
                        ElevatedButton(
                          style:
                              TextButton.styleFrom(minimumSize: Size(250, 40)),
                          onPressed: () => {},
                          child: const Text(
                            "Verify Email",
                            style: TextStyle(color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
