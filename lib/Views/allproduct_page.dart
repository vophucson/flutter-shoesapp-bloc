import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/blocs/bloc/product_bloc.dart';
import 'package:shoesappbloc/models/product_model.dart';
import 'package:shoesappbloc/side_in_animation.dart';
import 'package:shoesappbloc/widgets/appbar_widget.dart';
import 'package:shoesappbloc/widgets/shoescard_widget.dart';

class AllProductPage extends StatefulWidget {
  final List<ProductModel> data;
  const AllProductPage({Key? key, required this.data}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AllProductPage();
  }
}

class _AllProductPage extends State<AllProductPage> {
  Completer<void>? completer;
  @override
  void initState() {
    super.initState();
    completer = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const AppBarCus(
          title: 'Tất cả sản phẩm',
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(child: _buildAllProduct(context))
          ],
        ));
  }

  Widget _buildAllProduct(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is ProductSuccess) {
          completer?.complete();
          completer = Completer();
        }
      },
      builder: (context, state) {
        if (state is ProductSuccess || state is ProductInitial) {
          return RefreshIndicator(
            onRefresh: () {
              context.read<ProductBloc>().add(ProductRefresh());
              return completer!.future;
            },
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: state is ProductSuccess
                  ? state.products.length
                  : widget.data.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 1.7),
              ),
              itemBuilder: (context, index) {
                var data = state is ProductSuccess
                    ? state.products[index]
                    : widget.data[index];
                return SideInAnimation(
                  delay: 3,
                  child: GestureDetector(
                    onTap: () {},
                    child: ShoesCard(shoes: data),
                  ),
                );
              },
            ),
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
