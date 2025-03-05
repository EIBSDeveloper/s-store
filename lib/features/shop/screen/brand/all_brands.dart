import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widget/app_bar/appbar.dart';
import 'package:t_store/common/widget/brand_cards/brand_cards.dart';
import 'package:t_store/common/widget/layouts/grid_layout.dart';
import 'package:t_store/common/widget/texts/section_headings.dart';
import 'package:t_store/features/shop/screen/brand/brand_products.dart';

import '../../../../common/widget/loaders/shimmers/brand_shimmer.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controller/brand_controller.dart';

class AllBrandScreen extends StatelessWidget {
  const AllBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    return Scaffold(
      appBar: TAppBar(title: Text('Brands'),showBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
         padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [

              ///Headings
              TSectionHeading(title: 'Brands',showactionbutton: false,),
              SizedBox(height: TSizes.spaceBtwItems,),

              ///- Brands Cards
              Obx((){
                if(brandController.isLoading.value) return TBrandShimmer();
                if(brandController.featuredBrands.isEmpty){
                  return  Center(child: Text('No Data Found',style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white,)));
                }
                return   TGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    final brands=  brandController.allBrands[index];
                    print('Brand ImageUrl ${brandController.allBrands[index].toJson()} - ${brandController.allBrands[index].name}');
                    return  TBrandCard(
                      brand:brands ,
                      onTap: ()=>Get.to(()=>BrandProducts(brand:brands ,)),
                      showborder: false,
                    );
                  },
                );
              })
            ],
          ),
        )
      ),
    );
  }
}
