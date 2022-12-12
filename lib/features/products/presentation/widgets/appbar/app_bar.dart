import 'package:flutter/material.dart';

import '../../../../../core/resources/color_manager.dart';
import '../filter_modal_sheet.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const CustomAppBar({
    super.key,
    this.height = kToolbarHeight,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_pin,
            color: ColorManager.primary,
          ),
          const Text('Zihuatanejo, Gro'),
          Icon(
            Icons.arrow_drop_down,
            color: ColorManager.grey,
          )
        ],
      ),
      actions: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              backgroundColor: Colors.white,
              builder: (context) {
                return FilterModalSheet();
              },
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(
              Icons.filter_alt_outlined,
              color: ColorManager.text1,
            ),
          ),
        ),
      ],
    );
  }
}
