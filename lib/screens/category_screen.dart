import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
    const CategoryScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Categories'),
                backgroundColor: const Color(0xFF000A1F),
            ),
            body: Container(),
        );
    }
}