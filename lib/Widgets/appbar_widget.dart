import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class AppBarCus extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const AppBarCus({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 5,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Text(
        title,
        style: GoogleFonts.spartan(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.w700,
            letterSpacing: -1,
          ),
        ),
      ),
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back_rounded,
          color: Colors.black87,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: const [],
      systemOverlayStyle: SystemUiOverlayStyle.light,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50.0);
}
