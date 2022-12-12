import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';

class ColorSelector extends StatefulWidget {
  final List<String> colors;
  final VoidCallback onColorChange;
  const ColorSelector({
    super.key,
    required this.colors,
    required this.onColorChange,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  String? _selectedColor;

  @override
  void initState() {
    _selectedColor = widget.colors[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors.map((color) {
        return GestureDetector(
          onTap: () {
            if (_selectedColor != color) {
              setState(() {
                _selectedColor = color;
              });
            } else {
              return;
            }
            widget.onColorChange();
          },
          child: Container(
            width: 39,
            height: 39,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: HexColor.fromHex(color),
            ),
            child: Icon(
              _selectedColor == color ? Icons.check : null,
              color: ColorManager.white,
            ),
          ),
        );
      }).toList(),
    );
  }
}
