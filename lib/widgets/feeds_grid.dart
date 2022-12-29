import 'package:flutter/material.dart';

import '../models/api_products.dart';
import 'feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsLists})
      : super(key: key);
  final List<ProductsModel> productsLists;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return FeedsWidget(
            imageUrl: productsLists[index].images![0],
            title: productsLists[index].title.toString(),
          );
        });
  }
}
