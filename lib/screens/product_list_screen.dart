import 'package:flutter/material.dart';

import '../models/product_model.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = Product.products;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products List'),
        backgroundColor: const Color(0xFF000A1F),
      ),
      body: ListView(
        children: <Widget>[
          for (final Product product in products)
            ListTile(
              title: Text(product.name),
            ),
        ],
      ),
    );
  }
}
