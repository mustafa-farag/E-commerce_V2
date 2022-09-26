import 'package:commercialapp/utilities/images.dart';
import 'package:commercialapp/views/widgets/checkout/delivery_methods.dart';
import 'package:commercialapp/views/widgets/checkout/payment.dart';
import 'package:commercialapp/views/widgets/checkout/shipping_address.dart';
import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
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
              const SizedBox(height: 16.0,),
              SizedBox(
                height: size.height*0.125,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:const [
                      DeliveryMethodItem(imgUrl: AppImages.dhl),
                      SizedBox(width: 16.0,),
                      DeliveryMethodItem(imgUrl: AppImages.fedex),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
