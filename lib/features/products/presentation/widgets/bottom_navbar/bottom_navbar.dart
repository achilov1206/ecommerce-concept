import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/routes/routes_manager.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      decoration: BoxDecoration(
        color: ColorManager.onBackground,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Icon(
                CupertinoIcons.circle_fill,
                color: ColorManager.white,
                size: 15,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                AppStrings.explorer,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              Navigator.of(context).pushNamed(Routes.cart);
            },
            icon: Icon(
              CupertinoIcons.cart,
              color: ColorManager.white,
              size: 20,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.heart,
              color: ColorManager.white,
              size: 20,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {},
            icon: Icon(
              CupertinoIcons.person_solid,
              color: ColorManager.white,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
