import 'package:flutter/material.dart';

import '../../../utilities/images.dart';

class PaymentItem extends StatelessWidget {
  const PaymentItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.network(
              AppImages.masterCard,
              fit: BoxFit.cover,
              height: 40,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          '**** **** *** 4255',
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
