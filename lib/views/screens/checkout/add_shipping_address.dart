import 'package:flutter/material.dart';

class AddShippingAddressScreen extends StatelessWidget {
  const AddShippingAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Shipping Address',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
    );
  }
}
