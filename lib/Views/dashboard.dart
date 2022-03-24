import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesappbloc/fade_in_animation.dart';
import 'homepage.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return DashBoards();
  }
}

class DashBoards extends State<DashBoard> {
  @override
  void initState() {
    super.initState();
  }

  final List<Widget> widgetList = [
    const HomePage(),
    const HomePage(),
    const HomePage(),
    const HomePage(),
  ];
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Text(
          'Life Kicks',
          style: GoogleFonts.spartan(
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
        ),
      ),
      bottomNavigationBar: FadeInAnimation(
        delay: 1,
        child: BottomNavyBar(
          backgroundColor: Colors.white,
          //   color: Colors.white,
          items: [
            BottomNavyBarItem(
                icon: const Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Trang chính",
                  style: GoogleFonts.spartan(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      //       fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: const Icon(
                  Icons.shopping_cart,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Giỏi hàng",
                  style: GoogleFonts.spartan(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      //       fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: const Icon(
                  Icons.notifications_rounded,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Thông báo",
                  style: GoogleFonts.spartan(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      //      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
            BottomNavyBarItem(
                icon: const Icon(
                  Icons.supervised_user_circle_sharp,
                  color: Colors.redAccent,
                ),
                title: Text(
                  "Người dùng",
                  style: GoogleFonts.spartan(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black87,
                      //        fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                activeColor: Colors.grey),
          ],
          selectedIndex: _index,
          onItemSelected: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
      ),
      body: widgetList[_index],
    );
  }
}
