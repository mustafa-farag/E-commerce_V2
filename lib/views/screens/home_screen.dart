import 'package:commercialapp/controllers/database_controller.dart';
import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/utilities/images.dart';
import 'package:commercialapp/views/widgets/home_head_line_widget.dart';
import 'package:commercialapp/views/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final database = Provider.of<Database>(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.3,
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.network(
                  AppImages.topBannerHomeScreenImage,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.3,
                  child: Container(
                    color: Colors.black,
                    width: double.infinity,
                    height: size.height * 0.3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    bottom: 25.0,
                  ),
                  child: Text(
                    'Street Clothes',
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.026,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              children: [
                const HomeHeadLine(title: "Sale", caption: "Super summer sale"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: 340,
                  child: StreamBuilder<List<Products>>(
                      stream: database.saleProductsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available!'),
                            );
                          }
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ProductItem(
                                    product: products[index],
                                    isNew: false,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                              itemCount: products.length);
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                const HomeHeadLine(
                    title: "New", caption: "You've never seen it before!"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: 340,
                  child: StreamBuilder<List<Products>>(
                      stream: database.newProductsStream(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          final products = snapshot.data;
                          if (products == null || products.isEmpty) {
                            return const Center(
                              child: Text('No Data Available'),
                            );
                          }
                          return ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => ProductItem(
                                    product: products[index],
                                    isNew: true,
                                  ),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                              itemCount: products.length);
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }),
                ),
                SizedBox(
                  height: size.height * 0.038,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
