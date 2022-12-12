import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final String text;
  final TextStyle textStyle;
  final Color buttonColor;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.text,
    required this.textStyle,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  const CustomButton2({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorManager.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: child,
      ),
    );
  }
}

class CloseFilterButton extends StatelessWidget {
  const CloseFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.text1,
        ),
        child: Icon(
          Icons.close,
          color: ColorManager.white,
        ),
      ),
    );
  }
}

class AppBarButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  final IconData icon;
  final EdgeInsets padding;
  const AppBarButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
    required this.icon,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 37,
          height: 37,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: backgroundColor,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Icon(
              icon,
              color: iconColor,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool? _isFavorite;
  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite!;
        });
        widget.onTap();
      },
      child: Container(
        padding: const EdgeInsets.only(
          right: 10,
          top: 10,
        ),
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: ColorManager.favoriteButtonColor,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                )
              ],
            ),
            child: Icon(
              _isFavorite == true ? Icons.favorite : Icons.favorite_outline,
              color: ColorManager.primary,
              size: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class ProductLikeButton extends StatefulWidget {
  final bool isFavorite;
  final VoidCallback onTap;
  const ProductLikeButton({
    super.key,
    required this.isFavorite,
    required this.onTap,
  });

  @override
  State<ProductLikeButton> createState() => _ProductLikeButtonState();
}

class _ProductLikeButtonState extends State<ProductLikeButton> {
  bool? _isFavorite;

  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite!;
        });
        widget.onTap();
      },
      child: Container(
        width: 37,
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.text1,
        ),
        child: Align(
          alignment: Alignment.center,
          child: Icon(
            _isFavorite == true
                ? CupertinoIcons.heart_solid
                : CupertinoIcons.heart,
            color:
                _isFavorite == true ? ColorManager.primary : ColorManager.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}
