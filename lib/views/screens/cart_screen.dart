import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/models/add_to_cart.dart';
import 'package:commercialapp/views/widgets/cart_list_item.dart';
import 'package:commercialapp/views/widgets/order_summary_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final database = Provider.of<Database>(context);
    int totalAmount =0;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Spacer(),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'My Cart',
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<List<AddToCartModel>>(
                stream: database.cartProductsStream(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.active) {
                    final cartProduct = snapshot.data;
                    if (cartProduct == null || cartProduct.isEmpty) {
                      return const Center(
                        child: Text('there is no data here!'),
                      );
                    }
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => CartListItem(
                        cartItem: cartProduct[index],
                      ),
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 10,
                      ),
                      itemCount: cartProduct.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
              OrderSummaryItem(title: 'Total Amount', value: totalAmount.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
