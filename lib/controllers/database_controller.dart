import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/services/firestore_services.dart';

abstract class Database {
  Stream<List<Products>> saleProductsStream();

  Stream<List<Products>> newProductsStream();
}

class FirestoreDatabase implements Database {
  final String user;
  final _service = FirestoreServices.instance;

  FirestoreDatabase({required this.user});

  @override
  Stream<List<Products>> saleProductsStream() => _service.collectionsStream(
        path: 'products/',
        builder: (data, documentId) => Products.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0),
      );

  @override
  Stream<List<Products>> newProductsStream() => _service.collectionsStream(
        path: 'products/',
        builder: (data, documentId) => Products.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isEqualTo: 0),
      );
}
