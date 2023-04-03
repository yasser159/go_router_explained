import 'package:flutter/material.dart';

class ProductListScreen extends StatelessWidget {
    const ProductListScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Products'),
                backgroundColor: const Color(0xFF000A1F),
            ),
            body: Container(),
        );
    }
}