import 'package:flutter/material.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/helpers/helpers.dart.dart';
import '../../../../core/resources/color_manager.dart';
import '../../data/model/cart_model.dart';

class CartElement extends StatelessWidget {
  final Basket cartItem;
  const CartElement({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 90,
                padding: const EdgeInsets.only(right: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    cartItem.images,
                    fit: BoxFit.cover,
                    loadingBuilder: (
                      BuildContext context,
                      Widget child,
                      ImageChunkEvent? loadingProgress,
                    ) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (
                      BuildContext context,
                      Object exception,
                      StackTrace? stackTrace,
                    ) {
                      return const Icon(
                        Icons.broken_image,
                        color: Colors.red,
                      );
                    },
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.title,
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          color: ColorManager.white,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    Currency.currencyAmountToDollarString(cartItem.price),
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 20,
                          color: ColorManager.primary,
                        ),
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              const ChangeCartItemQuantity(
                initialQuantity: 2,
              ),
              //Delete icon
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: ColorManager.grey2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChangeCartItemQuantity extends StatefulWidget {
  final int initialQuantity;
  const ChangeCartItemQuantity({
    super.key,
    required this.initialQuantity,
  });

  @override
  State<ChangeCartItemQuantity> createState() => _ChangeCartItemQuantityState();
}

class _ChangeCartItemQuantityState extends State<ChangeCartItemQuantity> {
  int _initialQuantity = 0;

  @override
  void initState() {
    _initialQuantity = widget.initialQuantity;
    super.initState();
  }

  void increaseQuantity() {
    setState(() {
      _initialQuantity++;
    });
  }

  void decreaseQuantity() {
    if (_initialQuantity > 0) {
      setState(() {
        _initialQuantity--;
      });
    } else {
      _initialQuantity = _initialQuantity;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 26,
      height: 68,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: ColorManager.backgroundColor2,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: decreaseQuantity,
            child: Icon(
              Icons.remove,
              size: 15,
              color: ColorManager.white,
            ),
          ),
          Text(
            _initialQuantity.toString(),
            style: TextStyle(
              color: ColorManager.white,
              fontSize: 18,
              fontWeight: FontWeightManager.medium,
            ),
          ),
          GestureDetector(
            onTap: increaseQuantity,
            child: Icon(
              Icons.add,
              size: 15,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    );
  }
}
