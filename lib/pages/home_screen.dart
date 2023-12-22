// import 'package:ocr_app/pages/bottom_navbar.dart';
// import 'package:ocr_app/pages/navbar.dart';
import 'package:flutter/material.dart';
import 'package:ocr_app/utils/color_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                        // decoration: BoxDecoration(
                        //   gradient: LinearGradient(
                        //       colors: [
                        //         hexStringToColor("FEEA37"),
                        //         hexStringToColor("FFFFFF"),
                        //         hexStringToColor("FFFFFF"),
                        //         hexStringToColor("FFFFFF"),
                        //       ],
                        //       begin: Alignment.topCenter,
                        //       end: Alignment.bottomLeft),
                        // ),
                        ),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              "Selamat Datang, ",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(left: 20, bottom: 20),
                    padding: const EdgeInsets.only(top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.camera,
                              size: 60,
                              color: Colors.amber,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Scan Image",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ],
                    ),
                    margin: const EdgeInsets.only(right: 20, bottom: 20),
                    padding: const EdgeInsets.only(top: 10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Icon(
                              Icons.camera_enhance,
                              size: 60,
                              color: Colors.amber,
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Import Image",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Terkini, ",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 130,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    colors: <Color>[
                      Color(0xffff0000),
                      Color(0xffDE1F1F),
                      Color(0xffd03131),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.only(left: 20, top: 15),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // SizedBox(
                        //   height: 20,
                        //   child: Text(
                        //     "Hi, ARYO DEVA SAPUTRA",
                        //     style: TextStyle(
                        //       color: Colors.white,
                        //       letterSpacing: 0.5,
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Container(
                    //       height: 60,
                    //       width: 130,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: const Color(0xffffffff),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 10),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Text(
                    //               "Your Balance",
                    //               style: TextStyle(fontSize: 10),
                    //             ),
                    //             const SizedBox(height: 5),
                    //             Row(
                    //               children: [
                    //                 const Text(
                    //                   "Rp 15.000",
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 12),
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Image.asset('assets/icons/right-arrow.png',
                    //                     width: 12),
                    //                 const SizedBox(width: 5),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Container(
                    //       height: 60,
                    //       width: 130,
                    //       decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(5),
                    //         color: const Color(0xffffffff),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(left: 10),
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Text(
                    //               "Bonus Balance",
                    //               style: TextStyle(fontSize: 10),
                    //             ),
                    //             const SizedBox(height: 5),
                    //             Row(
                    //               children: [
                    //                 const Text(
                    //                   "0",
                    //                   style: TextStyle(
                    //                       fontWeight: FontWeight.bold,
                    //                       fontSize: 12),
                    //                 ),
                    //                 const SizedBox(width: 5),
                    //                 Image.asset('assets/icons/right-arrow.png',
                    //                     width: 12),
                    //                 const SizedBox(width: 5),
                    //               ],
                    //             )
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //     const SizedBox(width: 10),
                    //   ],
                    // )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
