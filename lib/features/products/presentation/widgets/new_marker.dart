import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class NewMarker extends StatelessWidget {
  const NewMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 27,
      height: 27,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: ColorManager.primary,
      ),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          AppStrings.newString,
          style: TextStyle(
            color: ColorManager.white,
            fontSize: 10,
          ),
        ),
      ),
    );
  }
}
