import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/models/delivery_methods.dart';
import 'package:commercialapp/views/widgets/checkout/checkout_order_details.dart';
import 'package:commercialapp/views/widgets/checkout/delivery_methods.dart';
import 'package:commercialapp/views/widgets/checkout/payment.dart';
import 'package:commercialapp/views/widgets/checkout/shipping_address.dart';
import 'package:commercialapp/views/widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16.0,
              ),
              const ShippingAddressItem(),
              const SizedBox(
                height: 32.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Payment',
                    style: Theme.of(context).textTheme.headline6,
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
                height: 16.0,
              ),
              const PaymentItem(),
              const SizedBox(
                height: 32.0,
              ),
              Text(
                'Delivery Methods',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 16.0,
              ),
              SizedBox(
                height: size.height * 0.125,
                child: StreamBuilder<List<DeliveryMethod>>(
                  stream: database.deliveryMethodsStream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      final deliveryMethod = snapshot.data;
                      if (deliveryMethod == null || deliveryMethod.isEmpty) {
                        return Center(
                          child: Text(
                            'No delivery Method available!',
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        );
                      }
                      return ListView.separated(
                        itemBuilder: (_,index) => DeliveryMethodItem(deliveryMethod: deliveryMethod[index]),
                        separatorBuilder: (_,index) => const SizedBox(width: 20.0,),
                        itemCount: deliveryMethod.length,
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 32.0,
              ),
              const CheckoutOrderDetails(),
              const SizedBox(
                height: 32.0,
              ),
              DefaultButton(
                onPressed: () {},
                text: 'Submit Order',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
