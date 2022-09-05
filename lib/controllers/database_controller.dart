import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/models/user_data.dart';
import 'package:commercialapp/services/firestore_services.dart';
import 'package:commercialapp/utilities/api_pathes.dart';

abstract class Database {
  Stream<List<Products>> saleProductsStream();

  Stream<List<Products>> newProductsStream();

  Future<void> setUserData(UserData userData);
}

class FirestoreDatabase implements Database {
  final String user;
  final _service = FirestoreServices.instance;

  FirestoreDatabase({required this.user});

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
}
