import 'package:commercialapp/utilities/images.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int? discountValue;
  final String category;
  final double? rate;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.imgUrl,
    this.discountValue,
    this.category = 'Other',
    this.rate,
  });
}
 List<Product> dummyProducts = [
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
    discountValue: 20,
  ),
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
  ),
  Product(
    id: '1',
    title: 'Evening Dress',
    price: 18,
    imgUrl: AppImages.saleImage,
    category: 'Dorothy Perkins',
    discountValue: 20,
  ),
];