import 'package:commercialapp/models/product_model.dart';
import 'package:commercialapp/utilities/images.dart';
import 'package:commercialapp/views/widgets/product_item.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                _homeHeadlines(context,
                    title: "Sale", caption: "Super summer sale"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          ProductItem(product: dummyProducts[index],isNew: false,),
                      separatorBuilder: (context, index) => const SizedBox(
                            width: 20.0,
                          ),
                      itemCount: dummyProducts.length),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                _homeHeadlines(context,
                    title: "New", caption: "You've never seen it before!"),
                SizedBox(
                  height: size.height * 0.02,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          ProductItem(product: dummyProducts[index], isNew: true,),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: 20.0,
                      ),
                      itemCount: dummyProducts.length),
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

  Widget _homeHeadlines(context,
          {required String title,
          required String caption,
          VoidCallback? onTap}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              InkWell(
                onTap: onTap,
                child: Text(
                  'View all',
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: Colors.black,
                      ),
                ),
              )
            ],
          ),
          Text(
            caption,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  color: Colors.grey,
                ),
          )
        ],
      );
}
