import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nurax User"),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: CircleAvatar(
                child: Image.asset("assets/images/6998058.png"),
                radius: MediaQuery.of(context).size.width / 3,
              ),
            ),
          ),
          const ListTile(title: Text("User Name"), subtitle: Text("Nuraxmet Aidarbek"),),
          Row(children: <Widget>[
            Container(child: Text("20.590 ETH"),),
          ],)
       ],
      ),
    );
  }
}
