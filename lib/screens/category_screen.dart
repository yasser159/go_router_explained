import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/category_model.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Category> categories = Category.categories;

    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Color(0xFF000A1F),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          Category category = categories[index];
          return ListTile(
            title: Text(category.name),
            onTap: () {
              return context.go(
                context.namedLocation('product_list', params: <String, String>{
                  'category': category.name
                }, queryParams: <String, String>{
                  'sort': 'asc',
                  'filter': '0'
                }),
              );
            },
          );
        },
      ),
    );
  }
}
