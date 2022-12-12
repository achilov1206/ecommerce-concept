import 'package:flutter/material.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';

class CapacitySelector extends StatefulWidget {
  final List<String> capacities;
  final VoidCallback onCapacityChange;
  const CapacitySelector({
    super.key,
    required this.capacities,
    required this.onCapacityChange,
  });

  @override
  State<CapacitySelector> createState() => _CapacitySelectorrState();
}

class _CapacitySelectorrState extends State<CapacitySelector> {
  String? _selectedCapacity;

  @override
  void initState() {
    _selectedCapacity = widget.capacities[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.capacities.map((capacity) {
        return GestureDetector(
          onTap: () {
            if (_selectedCapacity != capacity) {
              setState(() {
                _selectedCapacity = capacity;
              });
            } else {
              return;
            }
            widget.onCapacityChange();
          },
          child: Container(
            width: 70,
            height: 30,
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: _selectedCapacity == capacity
                  ? ColorManager.primary
                  : ColorManager.white,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                capacity,
                style: TextStyle(
                  color: _selectedCapacity == capacity
                      ? ColorManager.white
                      : ColorManager.grey,
                  fontSize: 13,
                  fontWeight: FontWeightManager.semiBold,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
