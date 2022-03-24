import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesappbloc/models/product_model.dart';
import 'package:flutter_format_money_vietnam/flutter_format_money_vietnam.dart';

class ShoesCard extends StatelessWidget {
  final ProductModel shoes;
  const ShoesCard({Key? key, required this.shoes}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white30,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 8),
        child: Column(
          children: [
            Container(
              width: 180.0,
              height: 140.0,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                top: 12,
                right: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black12, width: 1),
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage(shoes.imageUrl.toString()),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              shoes.categoryName,
              style: GoogleFonts.spartan(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  letterSpacing: -1,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 120,
              child: Center(
                child: Text(
                  shoes.productName,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: GoogleFonts.spartan(
                    textStyle: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -1,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Giá: ${shoes.productPrice.toVND(unit: 'VNĐ')}",
              style: GoogleFonts.spartan(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
