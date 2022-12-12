import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/helpers/helpers.dart.dart';
import '../../../../core/routes/routes_manager.dart';
import '../../../../core/widgets/buttons.dart';
import '../../data/models/product_info_model.dart';
import '../../data/repositories/product_info_repository.dart';
import '../bloc/product_detail/product_detail_bloc.dart';
import '../widgets/custom_rating_bar.dart';
import '../widgets/parts/product_tabs_section.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle buttonTextStyle = Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(color: ColorManager.white, fontSize: 20);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 67,
        leading: AppBarButton(
          onTap: () {
            Navigator.pop(context);
          },
          backgroundColor: ColorManager.text1,
          icon: Icons.arrow_back_ios,
          iconColor: ColorManager.white,
          padding: const EdgeInsets.only(
            left: 30,
            top: 10,
            bottom: 10,
          ),
        ),
        title: Text(
          AppStrings.productDetails,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        actions: [
          AppBarButton(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.cart);
            },
            backgroundColor: ColorManager.primary,
            icon: CupertinoIcons.cart,
            iconColor: ColorManager.white,
            padding: const EdgeInsets.only(
              right: 30,
              top: 10,
              bottom: 10,
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => ProductDetailBloc(
          RepositoryProvider.of<ProductInfoRepository>(context),
        )..add(LoadProductDetailEvent()),
        child: BlocBuilder<ProductDetailBloc, ProductDetailState>(
          builder: (context, state) {
            if (state is ProductDetailLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ProductDetailLoadingErrorState) {
              return const Center(
                child: Text(
                  AppStrings.smthWentWrong,
                ),
              );
            }
            if (state is ProductDetailLoadedState) {
              final ProductInfo productDetail = state.productDetail;
              return Column(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 0.8,
                      aspectRatio: 5 / 4,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.2,
                    ),
                    items: productDetail.images.map((String url) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            padding: const EdgeInsets.only(
                              bottom: 10,
                              top: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: Image.network(
                                url,
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 10,
                        left: 20,
                        right: 20,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  productDetail.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1!
                                      .copyWith(fontSize: 24),
                                ),
                                ProductLikeButton(
                                  isFavorite: productDetail.isFavorites,
                                  onTap: () {
                                    //Implement on like status change
                                  },
                                ),
                              ],
                            ),
                            CustomRatingBar(
                              initialRating: productDetail.rating,
                              onRatingUpdate: () {},
                              itemSize: 18,
                              color: ColorManager.ratingColor,
                            ),
                            ProductTabsSection(
                              tabBarHeight: 50,
                              productDetail: productDetail,
                              onChange: () {},
                            ),
                            CustomButton2(
                              onPressed: () {
                                //Add order to the cart
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    AppStrings.addToCart,
                                    style: buttonTextStyle,
                                  ),
                                  Text(
                                    Currency.currencyAmountToDollarString(
                                        productDetail.price),
                                    style: buttonTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
