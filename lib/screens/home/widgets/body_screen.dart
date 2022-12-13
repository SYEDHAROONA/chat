import 'dart:math';

import 'package:flutter/material.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({
    Key? key,
    required this.child,
    required this.bodyText,
    this.minHeight = 1,
  }) : super(key: key);

  final Widget child;
  final String bodyText;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: size.width,
          height: size.height,
          color: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              bodyText,
              style: const TextStyle(color: Colors.white, fontSize: 30),
            )
          ]),
        ),
        Container(
          width: size.width,
          height: size.height * 0.8 * minHeight!,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          child: child,
        )
      ],
    );
  }
}
