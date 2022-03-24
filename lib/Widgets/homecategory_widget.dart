import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoesappbloc/Blocs/bloc/category_bloc.dart';
import 'package:shoesappbloc/blocs/bloc/productbycid_bloc.dart';
import 'package:shoesappbloc/bouncypage_route.dart';
import 'package:shoesappbloc/views/productbycid_page.dart';

import '../fade_in_animation.dart';

class HomeCategory extends StatelessWidget {
  const HomeCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryFetched());
    return Center(
      child: Container(color: Colors.white, child: _buildCategoryList(context)),
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryLoading) {
          return const Center(
              child: Center(
            child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)),
          ));
        } else if (state is CategorySuccess) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(left: 10, top: 3),
                      child: Text(
                        'Các thương hiệu',
                        style: GoogleFonts.spartan(
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -1,
                          ),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 120,
                  alignment: Alignment.center,
                  child: FadeInAnimation(
                    delay: 3,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: state.categories.length,
                      itemBuilder: (context, index) {
                        var data = state.categories[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  BouncyPageRoute(
                                      widget: BlocProvider(
                                    create: (context) => ProductbycidBloc(),
                                    child: ProductByCidPage(
                                      categoryId: data.categoryId,
                                    ),
                                  )));
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  width: 70,
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: Image(
                                    image: NetworkImage(
                                        data.categoryImage.toString()),
                                    fit: BoxFit.contain,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.rectangle,
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.black12, width: 1),
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(15),
                                    ),
                                  ),
                                ),
                                Text(
                                  data.categoryName.toString(),
                                  style: GoogleFonts.spartan(
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -1,
                                    ),
                                  ),
                                )
                              ],
                            ));
                      },
                    ),
                  ),
                ),
              ),
            ],
          );
        } else if (state is CategoryFailure) {
          return const Center(
            child: Text('Không lấy được dữ liệu'),
          );
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
