import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoesappbloc/blocs/bloc/productbycid_bloc.dart';
//import 'package:shoesappbloc/side_in_animation.dart';
import 'package:shoesappbloc/widgets/appbar_widget.dart';
import 'package:shoesappbloc/widgets/shoescard_widget.dart';

class ProductByCidPage extends StatelessWidget {
  final int categoryId;
  const ProductByCidPage({Key? key, required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<ProductbycidBloc>()
        .add(ProductbycidFetched(categoryId: categoryId));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarCus(
        title: 'Sản phẩm theo thương hiệu',
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Expanded(child: listProductBycid(context))
        ],
      ),
    );
  }

  Widget listProductBycid(BuildContext context) {
    return BlocBuilder<ProductbycidBloc, ProductbycidState>(
      builder: (context, state) {
        if (state is ProductbycidLoading) {
          return const Center(
              child: CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.redAccent)));
        } else if (state is ProductbycidSuccess) {
          return GridView.builder(
            shrinkWrap: true,
            itemCount: state.products.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.7),
            ),
            itemBuilder: (context, index) {
              var data = state.products[index];
              return GestureDetector(
                  onTap: () {},
                  child: ShoesCard(
                    shoes: data,
                  ));
            },
          );
        } else if (state is ProductbycidFailure) {
          return const Center(
            child: Text('Không lấy được dữ liệu'),
          );
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
