import 'package:commercialapp/models/product_model.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final bool isNew;
  const ProductItem({Key? key, required this.product, required this.isNew}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                product.imgUrl,
                fit: BoxFit.cover,
                height: 230,
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
                      color: isNew==true? Colors.black : Theme.of(context).primaryColor ,
                    ),
                  child: Center(
                    child: Text(
                      isNew==true?'New':'-${product.discountValue.toString()}%',
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
        const SizedBox(height: 8,),
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
        Text(
          "${product.price.toString()}\$",
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
