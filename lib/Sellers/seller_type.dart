import 'package:building_project/Sellers/seller_registration.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SellerType extends StatefulWidget {
  @override
  _sellerTypeState createState() => _sellerTypeState();
}

class _sellerTypeState extends State<SellerType> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Become a Seller"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                padding: const EdgeInsets.only(top: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "What are",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    Text(
                      "You?",
                      style: TextStyle(fontSize: 20, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: const ButtonStyle(),
                  onPressed: () {
                    setState(() {});
                    // Future.delayed(const Duration(seconds: 3), () {
                    //   setState(() {
                    //     isLoading = false;

                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 const SellerRegistration()));
                    //   });
                    // });
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Loading...',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : const Text("Manufacturer")),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      isLoading = true;
                    });
                    // Future.delayed(const Duration(seconds: 3), () {
                    //   setState(() {
                    //     isLoading = false;
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 const SellerRegistration()));
                    //   });
                    // });
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Loading...',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : const Text("Distributor")),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                style: ButtonStyle(),
                onPressed: () {
                  setState(() {
                    isLoading = true;
                  });
                  // Future.delayed(Duration(seconds: 3), () {
                  //   setState(() {
                  //     isLoading = false;
                  //     Navigator.push(
                  //         context,
                  //         MaterialPageRoute(
                  //             builder: (context) =>
                  //                 const SellerRegistration()));
                  //   });
                  // });
                },
                child: isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'Loading...',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ],
                      )
                    : const Text("Seller"),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    setState(() {
                      isLoading = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const SellerRegistration()));
                    });
                    // Future.delayed(Duration(seconds: 3), () {
                    //   setState(() {
                    //     isLoading = false;
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) =>
                    //                 const SellerRegistration()));
                    //   });
                    // });
                  },
                  child: isLoading
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'Loading...',
                              style: TextStyle(fontSize: 20),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ],
                        )
                      : const Text("Dealer")),
            ),
          ],
        ),
      ),
    );
  }
}
