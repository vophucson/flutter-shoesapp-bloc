import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/Blocs/banner_bloc.dart';

import '../side_in_animation.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    context.read<BannerBloc>().add(BannerFetched());
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 250,
        child: BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerLoading) {
              return const Center(
                  child: CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.redAccent)));
            } else if (state is BannerSuccess) {
              return SideInAnimation(
                delay: 2,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                          height: 250,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 2),
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale),
                      itemBuilder:
                          (BuildContext context, int index, int realIndex) {
                        final urlImage = state.data[index].image;
                        return buildImage(urlImage, index);
                      },
                      itemCount: state.data.length,
                    )),
              );
            } else {
              return const Center(
                child: Text('Đã có lôi xảy ra'),
              );
            }
          },
        ));
  }

  Widget buildImage(String urlImage, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      color: Colors.grey,
      child: Image.network(
        urlImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
