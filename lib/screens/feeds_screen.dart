import 'package:flutter/material.dart';

import '../models/api_products.dart';
import '../services/apihanllder.dart';
import '../widgets/feeds_widget.dart';

class FeedsScreen extends StatefulWidget {
  const FeedsScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FeedsScreen> createState() => _FeedsScreenState();
}

class _FeedsScreenState extends State<FeedsScreen> {
  List<ProductsModel> productsLists = [];

  @override
  void didChangeDependencies() {
    getProductsData();
    super.didChangeDependencies();
  }

  Future getProductsData() async {
    productsLists = await Apihanlder.getAllProdcuts();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
      ),
      body: productsLists.isEmpty
          ? Container()
          : GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: productsLists.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 0.0,
                  mainAxisSpacing: 0.0,
                  childAspectRatio: 0.7),
              itemBuilder: (ctx, index) {
                return FeedsWidget(
                  imageUrl: productsLists[index].images![0],
                  title: productsLists[index].title.toString(),
                );
              }),
    );
  }
}
