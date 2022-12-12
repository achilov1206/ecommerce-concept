import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/size_manager.dart';
import '../../../../core/resources/strings_manager.dart';

class SearchField extends StatelessWidget {
  SearchField({super.key});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeManager.pageLeftPadding + 10,
        right: SizeManager.pageRightPadding + 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Form(
            key: _formKey,
            child: SizedBox(
              height: 34,
              width: 300,
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Icon(
                      Icons.search,
                      color: ColorManager.primary,
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  hintText: AppStrings.search,
                  filled: true,
                  fillColor: ColorManager.white,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            customBorder: const CircleBorder(),
            splashColor: ColorManager.white.withOpacity(0.5),
            onTap: () {},
            child: Ink(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: ColorManager.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.list_sharp,
                  color: ColorManager.white,
                )),
          ),
        ],
      ),
    );
  }
}
