import 'package:flutter/material.dart';

class DetailsInfo extends StatelessWidget {
  final String title;
  final String detail;

  const DetailsInfo({
    required this.detail,
    required this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline2!
                .copyWith(color: const Color(0xff000000)),
          ),
          Text(
            detail,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
