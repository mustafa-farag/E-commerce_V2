import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/models/add_to_cart.dart';
import 'package:flutter/material.dart';

class CartController with ChangeNotifier {
  final database = FirestoreDatabase(uid: '123');

  Future<void> addToCart({
    required String size,
    required String imgUrl,
    required String productId,
    required int price,
    required String title,
    required String id,
  }) async {
    try {
      final addToCartProduct = AddToCartModel(
        id: id,
        title: title,
        price: price,
        productId: productId,
        imgUrl: imgUrl,
        size: size,
      );
      await database.addToCart(addToCartProduct);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
