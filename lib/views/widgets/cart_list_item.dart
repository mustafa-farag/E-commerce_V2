import 'package:flutter/material.dart';
import '../../models/add_to_cart.dart';

class CartListItem extends StatelessWidget {
  final AddToCartModel cartItem;

  const CartListItem({Key? key, required this.cartItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                bottomLeft: Radius.circular(16),
              ),
              child: Image.network(
                cartItem.imgUrl,
                fit: BoxFit.cover,
                height: 125,
              ),
            ),
            const SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cartItem.title,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                const SizedBox(
                  height: 4.0,
                ),
                Row(
                  children: [
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Color: ',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                          TextSpan(
                            text: cartItem.color,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 5,),
                    Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Size: ',
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.grey,
                                    ),
                          ),
                          TextSpan(
                            text: cartItem.size,
                            style:
                                Theme.of(context).textTheme.caption!.copyWith(
                                      color: Colors.black,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 5.0,),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(Icons.more_vert),
                  Text(
                    '${cartItem.price}\$',
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
