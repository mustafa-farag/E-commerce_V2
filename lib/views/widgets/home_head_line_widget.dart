import 'package:flutter/material.dart';

class HomeHeadLine extends StatelessWidget {
  final String title;
  final String caption;
  final VoidCallback? onTap;
  const HomeHeadLine({Key? key, required this.title, required this.caption, this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
}
