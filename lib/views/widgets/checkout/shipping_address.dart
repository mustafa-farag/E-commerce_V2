import 'package:commercialapp/models/shipping_address.dart';
import 'package:flutter/material.dart';

class ShippingAddressItem extends StatelessWidget {
  final ShippingAddress shippingAddress;

  const ShippingAddressItem({Key? key, required this.shippingAddress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  shippingAddress.fullName,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Change',
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(shippingAddress.address,
                style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(
              height: 4.0,
            ),
            Text(
                '${shippingAddress.city},${shippingAddress.state},${shippingAddress.country}',
                style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
