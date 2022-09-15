import 'package:commercialapp/models/add_to_cart.dart';
import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/models/user_data.dart';
import 'package:commercialapp/services/firestore_services.dart';
import 'package:commercialapp/utilities/api_pathes.dart';

abstract class Database {
  Stream<List<Products>> saleProductsStream();

  Stream<List<Products>> newProductsStream();

  Future<void> setUserData(UserData userData);

  Future<void> addToCart(AddToCartModel cartModel);

  Stream<List<AddToCartModel>> cartProductsStream();
}

class FirestoreDatabase implements Database {
  final String uid;
  final _service = FirestoreServices.instance;

  FirestoreDatabase({required this.uid});

  @override
  Stream<List<Products>> saleProductsStream() => _service.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Products.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  @override
  Stream<List<Products>> newProductsStream() => _service.collectionsStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Products.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isEqualTo: 0),
      );

  @override
  Future<void> setUserData(UserData userData) async => await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );

  @override
  Future<void> addToCart(AddToCartModel cartModel) async =>
      await _service.setData(
        path: ApiPath.addToCart(uid, cartModel.id),
        data: cartModel.toMap(),
      );

  @override
  Stream<List<AddToCartModel>> cartProductsStream() {
    return _service.collectionsStream(
      path: ApiPath.getCartProducts(uid),
      builder: (data, documentId) => AddToCartModel.fromMap(data!, documentId),
    );
  }
}
