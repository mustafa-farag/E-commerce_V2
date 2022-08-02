import 'package:commercialapp/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Products product;

  const ProductDetails({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        actions: const [Icon(Icons.share)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}
