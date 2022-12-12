import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/helpers.dart.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/routes/routes_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../data/models/product_model.dart';
import '../../bloc/product/product_bloc.dart';

class BestSellerSection extends StatelessWidget {
  const BestSellerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductLoadingErrorState) {
          return const Center(
            child: Text(
              AppStrings.smthWentWrong,
            ),
          );
        }
        if (state is ProductNoInternetState) {
          return const Center(
            child: Text(
              AppStrings.noInternet,
            ),
          );
        }
        if (state is ProductLoadedState) {
          final List<BestSeller> bestSeller = state.product.bestSeller;
          return Padding(
            padding: EdgeInsets.only(
              left: SizeManager.pageLeftPadding,
              right: SizeManager.pageRightPadding,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 180 / 220,
              ),
              itemCount: bestSeller.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.productDetails);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorManager.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Image.network(
                                bestSeller[index].picture,
                                height: 170,
                                fit: BoxFit.cover,
                                loadingBuilder: (
                                  BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress,
                                ) {
                                  if (loadingProgress == null) return child;
                                  return CircularProgressIndicator(
                                    value: loadingProgress.expectedTotalBytes !=
                                            null
                                        ? loadingProgress
                                                .cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                        : null,
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
                            Positioned(
                              right: 10,
                              top: 10,
                              child: FavoriteButton(
                                isFavorite: bestSeller[index].isFavorites,
                                onTap: () {
                                  //Implement add to favorite
                                  print('Favorite button tapped');
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              Text(
                                Currency.currencyAmountToDollarString(
                                  bestSeller[index].discountPrice,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                Currency.currencyAmountToDollarString(
                                  bestSeller[index].priceWithoutDiscount,
                                ),
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 10),
                          child: Text(
                            bestSeller[index].title,
                            style: Theme.of(context).textTheme.subtitle1,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
        return Container();
      },
    );
  }
}
