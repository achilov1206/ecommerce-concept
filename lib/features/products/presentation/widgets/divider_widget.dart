import 'package:flutter/material.dart';

import '../../../../core/resources/size_manager.dart';

class DividerWidget extends StatelessWidget {
  final String label;
  final String linkText;
  final VoidCallback onPressed;
  const DividerWidget({
    super.key,
    required this.label,
    required this.linkText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeManager.pageLeftPadding,
        right: SizeManager.pageRightPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.headline1,
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(
              linkText,
              style: Theme.of(context).textTheme.button,
            ),
          ),
        ],
      ),
    );
  }
}
