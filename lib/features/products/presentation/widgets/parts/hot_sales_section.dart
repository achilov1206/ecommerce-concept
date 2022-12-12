import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../data/models/product_model.dart';
import '../../bloc/product/product_bloc.dart';
import '../new_marker.dart';

class HotSalesSection extends StatelessWidget {
  const HotSalesSection({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        left: SizeManager.pageLeftPadding,
        right: SizeManager.pageRightPadding,
      ),
      height: 180,
      child: BlocBuilder<ProductBloc, ProductState>(
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
            final List<HomeStore> hotSaleProducts = state.product.homeStore;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: hotSaleProducts.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Container(
                    width: width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: NetworkImage(
                          hotSaleProducts[index].picture,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(right: width / 2),
                      padding: const EdgeInsets.only(
                        left: 30,
                        bottom: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.black,
                            Colors.black.withOpacity(0.1),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (hotSaleProducts[index].isNew == true)
                            const NewMarker(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                hotSaleProducts[index].title,
                                style: Theme.of(context).textTheme.headline4,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                hotSaleProducts[index].subtitle,
                                style: Theme.of(context).textTheme.headline5,
                              ),
                            ],
                          ),
                          CustomButton(
                            onPressed: () {},
                            width: 100,
                            height: 24,
                            text: AppStrings.buyNow,
                            textStyle: Theme.of(context).textTheme.subtitle1!,
                            buttonColor: ColorManager.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }
          return Container();
        },
      ),
    );
  }
}
