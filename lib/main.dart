import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftapp/screens/auth_screen.dart';
import 'package:nftapp/screens/editor_screen.dart';
import 'package:nftapp/screens/home_screen.dart';
import 'package:nftapp/screens/main_screen.dart';

import 'api_contacts.dart';

void main() {
  ApiService service = new ApiService();
  var file = File('assets/images/user.jpeg');

  // var res = service.setImage(file);

  // res.then(((value) => debugPrint(value)));
  // var res = service.getImages();
  // res.then(((value) {
  //   for (var item in value!) {
  //     var id = item.id;
  //     var url = item.url;
  //     debugPrint("$id = $url");
  //   }
  // }));
  // Future<ImageServer?> res = service.getImage(1);
  // res.then(((value) {
  //   debugPrint(value?.url);
  // }));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, child) {
        return MaterialApp(
          title: 'NFT App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Dsignes',
            primarySwatch: Colors.blue,
            // ignore: deprecated_member_use
          ),
          home: const AuthorizationScreen(),
          routes: {
            EditorScreen.routeName: (context) => EditorScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}
