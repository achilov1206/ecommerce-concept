import 'package:flutter/material.dart';

import '../../../../../core/resources/assets_manager.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/strings_manager.dart';
import '../../../data/models/product_info_model.dart';
import '../color_selector.dart';
import '../capacity_selector.dart';

class ProductTabsSection extends StatelessWidget {
  final double tabBarHeight;
  final ProductInfo productDetail;
  final VoidCallback onChange;
  const ProductTabsSection({
    Key? key,
    required this.tabBarHeight,
    required this.productDetail,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: tabBarHeight,
            child: TabBar(
              labelStyle: Theme.of(context).textTheme.headline1!.copyWith(
                    fontSize: 18,
                  ),
              labelColor: ColorManager.text1,
              unselectedLabelStyle:
                  Theme.of(context).textTheme.headline5!.copyWith(
                        fontSize: 18,
                      ),
              indicatorColor: ColorManager.primary,
              unselectedLabelColor: ColorManager.grey,
              tabs: const [
                Tab(text: AppStrings.shop),
                Tab(text: AppStrings.details),
                Tab(text: AppStrings.feautures),
              ],
            ),
          ),
          SizedBox(
            height: 160,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: TabBarView(
                children: [
                  TabBarView1(productDetail: productDetail),
                  const Text('No Content yet'),
                  const Text('No Content yet'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarView1 extends StatelessWidget {
  final ProductInfo productDetail;
  const TabBarView1({super.key, required this.productDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            productDetailIndicator(
              context: context,
              imageUrl: ImageAssets.processor,
              label: productDetail.cpu,
            ),
            productDetailIndicator(
              context: context,
              imageUrl: ImageAssets.camera,
              label: productDetail.camera,
            ),
            productDetailIndicator(
              context: context,
              imageUrl: ImageAssets.ram,
              label: productDetail.ssd,
            ),
            productDetailIndicator(
              context: context,
              imageUrl: ImageAssets.ssd,
              label: productDetail.sd,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
          ),
          child: Text(
            AppStrings.selectColorAndCapacity,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ColorSelector(
              colors: productDetail.color,
              onColorChange: () {},
            ),
            CapacitySelector(
              capacities: const [
                '128 GB',
                '256 GB',
              ],
              onCapacityChange: () {},
            )
          ],
        ),
      ],
    );
  }
}

Widget productDetailIndicator({
  required BuildContext context,
  required String imageUrl,
  required String label,
}) {
  return SizedBox(
    width: 80,
    child: Column(
      children: [
        Image.asset(
          imageUrl,
          width: 28,
          height: 28,
        ),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .headline5!
              .copyWith(color: ColorManager.grey2),
        )
      ],
    ),
  );
}
