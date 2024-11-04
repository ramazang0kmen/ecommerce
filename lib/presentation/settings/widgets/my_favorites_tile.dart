import 'package:ecommerce/common/helper/navigator/app_navigator.dart';
import 'package:ecommerce/core/configs/theme/app_colors.dart';
import 'package:ecommerce/presentation/settings/pages/my_favorites.dart';
import 'package:flutter/material.dart';

class MyFavoritesTile extends StatelessWidget {
  const MyFavoritesTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, const MyFavoritesPage());
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.secondBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'My Favorites',
            ),
          ],
        ),
      ),
    );
  }
}
