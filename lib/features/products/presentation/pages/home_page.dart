import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/strings_manager.dart';
import '../../../../core/services/connectivity_service.dart';
import '../../data/repositories/product_repository.dart';
import '../bloc/product/product_bloc.dart';
import '../widgets/appbar/app_bar.dart';
import '../widgets/parts/best_seller_section.dart';
import '../widgets/bottom_navbar/bottom_navbar.dart';
import '../widgets/parts/category_section.dart';
import '../widgets/divider_widget.dart';
import '../widgets/parts/hot_sales_section.dart';
import '../widgets/search_field.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        height: 40,
      ),
      body: BlocProvider(
        create: (context) => ProductBloc(
          RepositoryProvider.of<ProductRepository>(context),
          RepositoryProvider.of<ConnectivityService>(context),
        )..add(LoadProductEvent()),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Category section
              DividerWidget(
                label: AppStrings.selectCategory,
                linkText: AppStrings.viewAll,
                onPressed: () {
                  //onClick viewAll button
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const CategorySection(),
              const SizedBox(
                height: 20,
              ),
              //Serach Field
              SearchField(),
              const SizedBox(
                height: 15,
              ),
              //Hot Sales Section
              DividerWidget(
                label: AppStrings.hotSales,
                linkText: AppStrings.seeMore,
                onPressed: () {
                  //onClick see more button
                },
              ),
              const HotSalesSection(),
              //Best Seller Section
              DividerWidget(
                label: AppStrings.bestSeller,
                linkText: AppStrings.seeMore,
                onPressed: () {
                  //onClick see more button
                },
              ),
              BestSellerSection(),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavbar(),
    );
  }
}
