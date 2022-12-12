import 'package:flutter/material.dart';

import '../../../../../core/resources/size_manager.dart';
import '../../../../../core/data/mock.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../data/models/category_model.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  final List<Category> categories = categoriesMockData;

  String? selectedCategoryId;
  @override
  void initState() {
    selectedCategoryId = categories[0].id;
    super.initState();
  }

  bool isCategorySelected(String catId) {
    return catId == selectedCategoryId ? true : false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: SizeManager.pageLeftPadding + 10,
      ),
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: ((context, index) {
          return Padding(
            key: Key(categories[index].id.toString()),
            padding: const EdgeInsets.only(right: 10, left: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedCategoryId = categories[index].id;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: isCategorySelected(categories[index].id)
                          ? ColorManager.primary
                          : ColorManager.white,
                      shape: BoxShape.circle,
                    ),
                    width: 71,
                    height: 71,
                    child: Icon(
                      categories[index].catIcon,
                      color: isCategorySelected(categories[index].id)
                          ? ColorManager.white
                          : ColorManager.grey,
                      size: 35,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  categories[index].catTitle,
                  style: isCategorySelected(categories[index].id)
                      ? Theme.of(context).textTheme.subtitle2
                      : Theme.of(context).textTheme.subtitle1,
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
