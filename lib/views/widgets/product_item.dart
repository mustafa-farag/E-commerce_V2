import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/utilities/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ProductItem extends StatelessWidget {
  final Products product;
  final bool isNew;

  const ProductItem({Key? key, required this.product, required this.isNew,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context, rootNavigator: true)
          .pushNamed(AppRoutes.productDetails, arguments: product),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  product.imgUrl,
                  fit: BoxFit.cover,
                  height: 240,
                  width: 150,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  width: 50,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: isNew == true
                          ? Colors.black
                          : Theme.of(context).primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        isNew == true
                            ? 'New'
                            : '-${product.discountValue.toString()}%',
                        style: Theme.of(context).textTheme.caption!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          RatingBarIndicator(
            direction:Axis.horizontal,
            rating: 4.0,
            unratedColor: Colors.amber.withAlpha(50),
            itemCount: 5,
            itemSize: 20.0,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            product.category,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
          ),
          Text(
            product.title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          if (isNew == false)
            Row(
              children: [
                Text(
                  '${product.price.toString()}\$',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                ),
                Text(
                  ' ${product.price * (product.discountValue!) / 100}\$',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ],
            ),
          if (isNew == true)
            Text(
              '${product.price.toString()}\$',
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColor,
                  ),
            ),
        ],
      ),
    );
  }
}
