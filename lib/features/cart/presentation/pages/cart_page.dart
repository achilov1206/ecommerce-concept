import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/connectivity_service.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/helpers/helpers.dart.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/widgets/buttons.dart';
import '../../data/model/cart_model.dart';
import '../../data/repositories/cart_repository.dart';
import '../widgets/cart_element.dart';
import '../bloc/cart/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  final EdgeInsetsGeometry contentPadding = const EdgeInsets.only(
    left: 20,
    right: 20,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartBloc(
        RepositoryProvider.of<CartRepository>(context),
        RepositoryProvider.of<ConnectivityService>(context),
      )..add(LoadCartEvent()),
      child: Scaffold(
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                top: 16,
                right: 10,
              ),
              child: Text(
                AppStrings.selectLocation,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 15,
                    ),
              ),
            ),
            AppBarButton(
              onTap: () {
                //Implement select Location
              },
              backgroundColor: ColorManager.primary,
              icon: Icons.location_pin,
              iconColor: ColorManager.white,
              padding: const EdgeInsets.only(
                right: 30,
                top: 10,
                bottom: 10,
              ),
            ),
          ],
        ),
        body: BlocBuilder<CartBloc, CartState>(
          builder: (context, state) {
            if (state is CartLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CartLoadingErrorState) {
              return const Center(
                child: Text(
                  AppStrings.smthWentWrong,
                ),
              );
            }
            if (state is CartNoInternetState) {
              return const Center(
                child: Text(
                  AppStrings.noInternet,
                ),
              );
            }
            if (state is CartLoadedState) {
              Cart cart = state.cart;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      top: 30,
                      bottom: 30,
                    ),
                    child: Text(
                      AppStrings.myCart,
                      style: Theme.of(context)
                          .textTheme
                          .headline2!
                          .copyWith(fontSize: 35),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorManager.text1,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 50,
                            bottom: 20,
                          ),
                          child: Column(
                            children: [
                              //Cart Elements
                              ...cart.basket.map((item) {
                                return Padding(
                                  padding: contentPadding,
                                  child: CartElement(
                                    cartItem: item,
                                  ),
                                );
                              }),
                              Divider(
                                thickness: 2,
                                color: ColorManager.white.withOpacity(.25),
                              ),
                              //Total Price
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40,
                                  right: 40,
                                  top: 10,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.total,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(fontSize: 15),
                                    ),
                                    Text(
                                      Currency.currencyAmountToDollarString(
                                        cart.total,
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              //Delivery indicator
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 40,
                                  right: 40,
                                  bottom: 10,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      AppStrings.delivery,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5!
                                          .copyWith(fontSize: 15),
                                    ),
                                    Text(
                                      cart.delivery,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline4!
                                          .copyWith(fontSize: 15),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                thickness: 1,
                                color: ColorManager.white.withOpacity(.25),
                              ),
                              const SizedBox(height: 40),
                              //Checkout button
                              Container(
                                padding: contentPadding,
                                child: CustomButton2(
                                  onPressed: () {
                                    //Implement checkout
                                  },
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        AppStrings.checkout,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1!
                                            .copyWith(
                                              color: ColorManager.white,
                                              fontSize: 20,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
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
