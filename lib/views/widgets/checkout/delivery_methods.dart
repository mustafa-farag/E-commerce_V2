import 'package:flutter/material.dart';

class DeliveryMethodItem extends StatelessWidget {
  final String imgUrl;
  const DeliveryMethodItem({Key? key, required this.imgUrl}) : super(key: key);

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
              imgUrl,
              fit: BoxFit.cover,
              height: 35,
              width: 100,
            ),
            const SizedBox(
              height: 5.0,
            ),
            Text(
              '3-5 Days',
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
