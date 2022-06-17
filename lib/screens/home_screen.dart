import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:unicons/unicons.dart';
import 'package:nftapp/animations/page_transition.dart';
import 'package:nftapp/constants.dart';
import 'editor_screen.dart';
import '../animations/slide_animation.dart';
import 'nft_screen.dart';
import "main_screen.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
        "page": const NFTScreen(), 
      },
      {
        "page": const EditorScreen(),
        // "title": "Editor",
      },
      {
        "page": const MainScreen(), 
      }
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
            icon: Icon(
              UniconsLine.home
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.shop),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(UniconsLine.user_circle),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

