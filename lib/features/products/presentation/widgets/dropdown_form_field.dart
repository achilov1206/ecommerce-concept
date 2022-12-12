import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/font_manager.dart';

class DropDownFormField extends StatefulWidget {
  final List<String> choices;
  const DropDownFormField({
    super.key,
    required this.choices,
  });

  @override
  State<DropDownFormField> createState() => _DropDownFormFieldState();
}

class _DropDownFormFieldState extends State<DropDownFormField> {
  String? _currentSelectedValue;
  @override
  void initState() {
    _currentSelectedValue = widget.choices[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 37,
      child: FormField(
        builder: (FormFieldState state) {
          return InputDecorator(
            decoration: InputDecoration(
              labelStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeightManager.regular,
                  ),
              errorStyle: const TextStyle(
                color: Colors.redAccent,
                fontSize: 16.0,
              ),
              hintText: AppStrings.pleaseSelect,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorManager.white,
                  width: 0,
                ),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(10),
            ),
            isEmpty: _currentSelectedValue == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: _currentSelectedValue,
                isDense: true,
                onChanged: (String? newValue) {
                  setState(() {
                    _currentSelectedValue = newValue;
                    state.didChange(newValue);
                  });
                },
                items: widget.choices.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
