import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRatingBar extends StatefulWidget {
  final double initialRating;
  final bool ignoreGestures;
  final VoidCallback onRatingUpdate;
  final double itemSize;
  final Color color;
  const CustomRatingBar({
    Key? key,
    required this.initialRating,
    required this.onRatingUpdate,
    this.color = Colors.purple,
    this.ignoreGestures = false,
    this.itemSize = 20,
  }) : super(key: key);

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: widget.initialRating,
      minRating: 1,
      maxRating: 5,
      itemSize: widget.itemSize,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: widget.color,
      ),
      onRatingUpdate: (rating) {
        //print(rating);
      },
      ignoreGestures: widget.ignoreGestures,
    );
  }
}
