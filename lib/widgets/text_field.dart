import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;

  final TextEditingController controller;
  final TextInputType textInputType;

  const TextFieldWidget({
    required this.textInputType,
    required this.controller,
    required this.hintText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: SizedBox(
        height: 50.0,
        child: TextField(
          controller: controller,
          keyboardType: textInputType,
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: const Color(0xffffffff)),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: const Color(0xffffffff)),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 3,
                color: Color(0xffffffff),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 2,
                color: Color(0xffffffff),
              ),
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
        ),
      ),
    );
  }
}
