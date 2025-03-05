import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/data/repositories/banners/banner_repository.dart';
import 'package:t_store/data/repositories/brands/brand_repository.dart';
import 'package:t_store/data/repositories/categories/category_repository.dart';
import 'package:t_store/data/repositories/product/product_repository.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../common/widget/app_bar/appbar.dart';
import '../../../../common/widget/list_tile/setting_menu_tile.dart';
import '../../../../common/widget/texts/section_headings.dart';
import 'dummy_data/TDummyData.dart';

class UploadProducts extends StatelessWidget {
  const UploadProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Upload',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeading(
                title: 'Main Uploads',
                showactionbutton: false,
              ),
              TSettingMenuTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                subtitle: '',
                ontap: () {
                  CategoryRepository().uploadDummyCategoriesData(TDummyData.categories);
                },
              ),
              TSettingMenuTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                subtitle: '',
                ontap: () {
                  BrandRepository().uploadDummyBrandData(TDummyData.brands);
                },
              ),
              TSettingMenuTile(
                icon: Iconsax.shopping_cart,
                title: 'Upload Product',
                subtitle: '',
                ontap: () {

                  ProductRepository().uploadDummyProductData(TDummyData.product);
                },
              ),
              TSettingMenuTile(
                icon: Iconsax.cloud_add,
                title: 'Upload Banners',
                subtitle: '',
                ontap: () {
                  BannerRepository().uploadDummyBannerData(TDummyData.banners);
                },
              ),

              TSettingMenuTile(
                icon: Iconsax.link_square5,
                title: 'Upload Brand Category',
                subtitle: '',
                ontap: () {
                  CategoryRepository().uploadDummyBrandCategory(TDummyData.brandCategories);
                },
              ),
              TSettingMenuTile(
                icon: Iconsax.link,
                title: 'Upload Product Category',
                subtitle: '',
                ontap: () {
                  CategoryRepository().uploadDummyProductCategory(TDummyData.productCategories);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
