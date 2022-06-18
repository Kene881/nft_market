import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nftapp/screens/market_screen.dart';
import 'package:unicons/unicons.dart';
import 'package:nftapp/animations/page_transition.dart';
import 'package:nftapp/constants.dart';
import 'editor_screen.dart';
import '../animations/slide_animation.dart';
import 'nft_screen.dart';
import "main_screen.dart";
import 'package:expandable/expandable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final double _padding = 24;
  late List<Map<String, Widget>> pages;
  int selectedPageIndex = 0;

  late PageController _pageController;

  @override
  void initState() {
    pages = [
      {
        "page": const MainScreen(),
      },
      {
        "page": const MarketScreen(),
        // "title": "Editor",
      },
    ];
    _pageController = PageController(viewportFraction: 0.9);
    super.initState();
  }

  void selectPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Home Screen"),
        actions: [
          Row(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(right: 20),
                // ignore: deprecated_member_use
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  color: Theme.of(context).primaryColorDark,
                ),
                padding: const EdgeInsets.all(10),
                child: ExpandableNotifier(
                  child: Column(
                    children: [
                      Expandable(
                        collapsed: ExpandableButton(
                          child: Row(
                            children: const <Widget>[
                              Icon(UniconsLine.wallet),
                              SizedBox(
                                width: 10,
                              ),
                              Text("4.570 ETH"),
                            ],
                          ),
                        ),
                        expanded: Row(
                          children: [
                            Row(
                              children: const <Widget>[
                                Icon(UniconsLine.plus_square),
                                SizedBox(
                                  width: 10,
                                ),
                                Text("Add money"),
                              ],
                            ),
                            const SizedBox(width: 15,),
                            ExpandableButton(
                              child: const Text("Back"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 23,
                child: CircleAvatar(
                  radius: 20,
                  child: Image.asset("assets/images/6998058.png"),
                ),
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
      body: pages[selectedPageIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        elevation: 1,
        iconSize: 22.r,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.shop),
            label: 'Shop',
          ),
        ],
      ),
    );
  }
}
