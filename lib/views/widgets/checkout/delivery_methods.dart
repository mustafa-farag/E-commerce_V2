import 'package:flutter/material.dart';
import '../../../models/delivery_methods.dart';

class DeliveryMethodItem extends StatelessWidget {
  final DeliveryMethod deliveryMethod;
  const DeliveryMethodItem({Key? key, required this.deliveryMethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              deliveryMethod.imgUrl,
              fit: BoxFit.cover,
              height: 35,
              width: 100,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              deliveryMethod.days,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.grey,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
