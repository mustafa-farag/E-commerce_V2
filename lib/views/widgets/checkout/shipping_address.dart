import 'package:flutter/material.dart';

class ShippingAddressItem extends StatelessWidget {
  const ShippingAddressItem({Key? key}) : super(key: key);

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
                  'Mustafa Farag',
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
            Text('26 Mohamed Ouda Street',
                style: Theme.of(context).textTheme.subtitle1),
            const SizedBox(
              height: 4.0,
            ),
            Text('26 Mohamed Ouda Street',
                style: Theme.of(context).textTheme.subtitle1),
          ],
        ),
      ),
    );
  }
}
