import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool popButton;
  const AppBarWidget({
    Key? key,
    required this.popButton,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 160.0,
      decoration: BoxDecoration(
        borderRadius:
            const BorderRadius.only(bottomLeft: Radius.circular(35.0)),
        color: Theme.of(context).primaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          top: 80.0,
          right: 16.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            popButton == true
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xffffffff),
                    ),
                  )
                : const SizedBox.shrink(),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: const Color(0xffffffff),
                  ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(160.0);
}
