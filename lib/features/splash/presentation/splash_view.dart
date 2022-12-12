import 'package:ecommerce/core/resources/strings_manager.dart';
import 'package:flutter/material.dart';

import '../../../core/resources/color_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ColorManager.onBackground,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 132,
                height: 132,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.primary,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: (width / 2) - 66),
              child: const Text(
                AppStrings.ecommerceConcept,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
