import 'package:commercialapp/views/widgets/order_summary_item.dart';
import 'package:flutter/material.dart';

class CheckoutOrderDetails extends StatelessWidget {
  const CheckoutOrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        OrderSummaryItem(title: 'Order', value: '200\$'),
        OrderSummaryItem(title: 'Delivery', value: '30\$'),
        OrderSummaryItem(title: 'Summary', value: '230\$'),
      ],
    );
  }
}
