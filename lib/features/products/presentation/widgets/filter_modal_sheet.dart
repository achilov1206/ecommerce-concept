import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/widgets/buttons.dart';
import './dropdown_form_field.dart';

class FilterModalSheet extends StatelessWidget {
  FilterModalSheet({super.key});
  final _formKey = GlobalKey<FormState>();

  final _brands = [
    "Samsung",
    "Apple",
    "Nokia",
    "Google",
    "Xiaomi",
  ];
  final _price = [
    "\$200 - \$300",
    "\$300 - \$400",
    "\$400 - \$500",
    "\$500 - \$600",
  ];
  final _size = [
    "4.5 to 5.5 inches",
    "5.5 to 6.5 inches",
    "6.5 to 7.5 inches",
  ];

  @override
  Widget build(BuildContext context) {
    Widget formLabel(String label) {
      return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //Top
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CloseFilterButton(),
              Text(
                AppStrings.filterOptions,
                style: Theme.of(context).textTheme.headline2,
              ),
              CustomButton(
                onPressed: () {},
                width: 86,
                height: 37,
                text: AppStrings.done,
                textStyle: Theme.of(context).textTheme.headline2!.copyWith(
                      color: ColorManager.white,
                    ),
                buttonColor: ColorManager.primary,
              ),
            ],
          ),
          const SizedBox(height: 20),
          //Form
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                formLabel(AppStrings.brand),
                DropDownFormField(
                  choices: _brands,
                ),
                formLabel(AppStrings.price),
                DropDownFormField(
                  choices: _price,
                ),
                formLabel(AppStrings.size),
                DropDownFormField(
                  choices: _size,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
    ;
  }
}
