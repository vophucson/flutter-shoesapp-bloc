import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesappbloc/blocs/bloc/product_bloc.dart';
import 'package:shoesappbloc/bouncypage_route.dart';
import 'package:shoesappbloc/views/allproduct_page.dart';
import 'package:shoesappbloc/widgets/shoescard_widget.dart';

import '../fade_in_animation.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: _buildAllProduct(context),
      ),
    );
  }

  Widget _buildAllProduct(BuildContext context) {
    context.read<ProductBloc>().add(ProductFetched());
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoading) {
          return const Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        } else if (state is ProductSuccess) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 3),
                    child: Text(
                      'Tất cả sản phẩm',
                      style: GoogleFonts.spartan(
                        textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 4, right: 20),
                    child: RichText(
                        text: TextSpan(children: <TextSpan>[
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                BouncyPageRoute(
                                    widget: BlocProvider(
                                  create: (context) => ProductBloc(),
                                  child: AllProductPage(
                                    data: state.products,
                                  ),
                                )));
                          },
                        text: 'Xem tất cả',
                        style: GoogleFonts.spartan(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      )
                    ])),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              FadeInAnimation(
                delay: 3,
                child: Container(
                  height: MediaQuery.of(context).size.width / 1.6,
                  alignment: Alignment.centerLeft,
                  child: ListView.builder(
                    itemCount: state.products.length,
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var shoes = state.products[index];
                      return InkWell(
                        onTap: () {},
                        child: ShoesCard(shoes: shoes),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        } else if (state is ProductFailure) {
          return const Center(
            child: Text('Không lấy được dữ liệu'),
          );
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
