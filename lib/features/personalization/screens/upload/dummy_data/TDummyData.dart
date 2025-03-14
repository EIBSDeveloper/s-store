import 'package:t_store/features/shop/model/product_model.dart';

import '../../../../../routes/routes.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../shop/model/banner_model.dart';
import '../../../../shop/model/brand_category_model.dart';
import '../../../../shop/model/brand_model.dart';
import '../../../../shop/model/category_model.dart';
import '../../../../shop/model/product_attribute_model.dart';
import '../../../../shop/model/product_category_model.dart';
import '../../../../shop/model/product_variation_model.dart';

class TDummyData {
  /// Upload  dummy  Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(
        imageUrl: TImages.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(
        imageUrl: TImages.banner3,
        targetScreen: TRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(
        imageUrl: TImages.banner5,
        targetScreen: TRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: TImages.banner6,
        targetScreen: TRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: TImages.banner8,
        targetScreen: TRoutes.checkout,
        active: false),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: TImages.nikeLogo,
        name: 'Nike',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: TImages.adidasLogo,
        name: 'Adidas',
        productsCount: 95,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: TImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: TImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '5',
        image: TImages.appleLogo,
        name: 'Apple',
        productsCount: 16,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: TImages.acerlogo,
        name: 'Acer',
        productsCount: 36,
        isFeatured: false),
    BrandModel(
        id: '3',
        image: TImages.jordanLogo,
        name: 'Jordan',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: TImages.pumaLogo,
        name: 'Puma',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: TImages.zaraLogo,
        name: 'ZARA',
        productsCount: 36,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: TImages.electronicsIcon,
        name: 'Samsung',
        productsCount: 36,
        isFeatured: false),
  ];
  // static final List<BrandModel> brands = [
  //   BrandModel(
  //       id: '1183',
  //       image: TImages.nikeLogo,
  //       name:
  //           'https://firebasestorage.googleapis.com/v0/b/new-church-77e88.appspot.com/o/t-store-panel.zip?alt=media&token=c02d66ba-74cf-4ecc-9091-daf605bb1d86',
  //       productsCount: 265,
  //       isFeatured: false),
  // ];

  /// Upload  dummy Product
  static final List<ProductModel> product = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 1350.0,
      isFeatured: true,
      thumbnail: TImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage1,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage9
      ],
      salePrice: 1130.0,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134.0,
            salePrice: 122.6,
            image: TImages.productImage1,
            description:
                'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 132.0,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 32'},
        ),
        // Product Variation Model
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: TImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        // Product VariationModel
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: TImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        // Product VariationModel
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        // Product Variation Model
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: TImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
        // Product VariationModel
      ],
      productType: 'ProductType.variable',
    ),

    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35.0,
      salePrice: 30,
      isFeatured: true,
      thumbnail: TImages.productImage69,
      description:
          'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage68,
        TImages.productImage69,
        TImages.productImage5
      ],
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ), // ProductModel

    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: false,
      thumbnail: TImages.productImage64,
      description:
          'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage64,
        TImages.productImage65,
        TImages.productImage66,
        TImages.productImage67
      ],
      salePrice: 30,
      sku: 'ABR4569',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ), // ProductModel
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: false,
      thumbnail: TImages.productImage60,
      description:
          'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '6', image: TImages.zaraLogo, name: 'ZARA'),
      images: [
        TImages.productImage60,
        TImages.productImage61,
        TImages.productImage62,
        TImages.productImage63
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: TImages.productImage60,
            description:
                'This is a Product description for 4 Color collar t-shirt dry fit',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: TImages.productImage60,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: TImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
        // Product VariationModel
        ProductVariationModel(
            id: '4',
            stock: 200,
            price: 232,
            image: TImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        // Product VariationModel
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: TImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
        // Product VariationModel
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 250,
            image: TImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // Product VariationModel
        ProductVariationModel(
            id: '7',
            stock: 0,
            price: 324,
            image: TImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
        // Product VariationModel
        ProductVariationModel(
            id: '8',
            stock: 23,
            price: 385,
            image: TImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
        // Product VariationModel
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordon Shoes',
      stock: 15,
      price: 35,
      isFeatured: false,
      thumbnail: TImages.productImage10,
      description:
          'Nike Air Jordon Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(
          id: '1',
          image: TImages.nikeLogo,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true),
      images: [
        TImages.productImage7,
        TImages.productImage8,
        TImages.productImage9,
        TImages.productImage10
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: TImages.productImage8,
            description:
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            attributeValues: {'Color': 'Orange', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 35,
            image: TImages.productImage7,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 34,
            image: TImages.productImage9,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 33,
            image: TImages.productImage7,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 32,
            image: TImages.productImage9,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 31,
            image: TImages.productImage8,
            attributeValues: {'Color': 'Orange', 'Size': 'EU 32'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM)',
      stock: 15,
      price: 750,
      isFeatured: false,
      thumbnail: TImages.productImage11,
      description:
          'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Apple'),
      images: [
        TImages.productImage11,
        TImages.productImage12,
        TImages.productImage13,
        TImages.productImage12
      ],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: false,
      thumbnail: TImages.productImage18,
      description:
          'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '7', image: TImages.appleLogo, name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '008',
      title: 'APPLE iPhone 8 (Black, 64 GB)',
      stock: 15,
      price: 480,
      isFeatured: true,
      thumbnail: TImages.productImage14,
      description:
          'This is a Product description for iphone 8. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'iphone 8'),
      images: [
        TImages.productImage15,
        TImages.productImage16,
        TImages.productImage17,
        TImages.productImage14
      ],
      salePrice: 380,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ), // ProductModel
    ProductModel(
      id: '009',
      title: 'Nike Air Jordon 19 Blue',
      stock: 15,
      price: 400,
      isFeatured: true,
      thumbnail: TImages.productImage19,
      description:
          'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage19,
        TImages.productImage20,
        TImages.productImage21,
        TImages.productImage22,
      ],
      salePrice: 200,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '010',
      title: 'Nike Air Jordon 6 Orange',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage20,
      description:
          'This is a Product description for Nike Air Jordon. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage20,
        TImages.productImage23,
        TImages.productImage21,
        TImages.productImage22
      ],
      // salePrice: 200,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '011',
      title: 'Nike Air Max Red & Black',
      stock: 15,
      price: 600,
      isFeatured: true,
      thumbnail: TImages.productImage21,
      description:
          'This is a Product description for Nike Air Max. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage21,
        TImages.productImage20,
        TImages.productImage19,
        TImages.productImage22
      ],
      salePrice: 400,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '012',
      title: 'Nike Basketball shoes Black & Green',
      stock: 15,
      price: 600,
      isFeatured: false,
      thumbnail: TImages.productImage22,
      description:
          'This is a Product description for Nike Basketball shoes. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage22,
        TImages.productImage20,
        TImages.productImage21,
        TImages.productImage23
      ],
      salePrice: 400,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '013',
      title: 'Nike wild horse shoes',
      stock: 15,
      price: 600,
      isFeatured: false,
      thumbnail: TImages.productImage23,
      description:
          'This is a Product description for Nike wild horse shoes. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage23,
        TImages.productImage20,
        TImages.productImage21,
        TImages.productImage22
      ],
      salePrice: 400,
      sku: 'ABR4568',
      categoryId: '8',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    //Track suits
    ProductModel(
      id: '014',
      title: 'Nike Track suit red',
      stock: 15,
      price: 500,
      isFeatured: true,
      thumbnail: TImages.productImage26,
      description:
          'This is a Product description for Nike Track suit red. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage26,
        TImages.productImage24,
        TImages.productImage25,
        TImages.productImage27
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '9',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '015',
      title: 'Nike Track suit Black',
      stock: 15,
      price: 200,
      thumbnail: TImages.productImage24,
      description:
          'This is a Product description for Nike Track suit Black. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage24,
        TImages.productImage26,
        TImages.productImage25,
        TImages.productImage27
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '9',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],

      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '016',
      title: 'Nike Track suit Blue',
      stock: 15,
      price: 100,
      thumbnail: TImages.productImage25,
      description:
          'This is a Product description for Nike Track suit Blue. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage25,
        TImages.productImage24,
        TImages.productImage26,
        TImages.productImage27
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '9',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '017',
      title: 'Nike Track suit Parrot Green',
      stock: 15,
      price: 350,
      thumbnail: TImages.productImage27,
      description:
          'This is a Product description for Nike Track suit Parrot Green. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '1', image: TImages.nikeLogo, name: 'Nike'),
      images: [
        TImages.productImage27,
        TImages.productImage24,
        TImages.productImage25,
        TImages.productImage26
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '9',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    //Sports Equipments
    ProductModel(
      id: '018',
      title: 'Adidas Football',
      stock: 15,
      price: 40,
      isFeatured: true,
      thumbnail: TImages.productImage28,
      description:
          'This is a Product description for Football. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      images: [
        TImages.productImage28,
        TImages.productImage29,
        TImages.productImage30,
        TImages.productImage31
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '019',
      title: 'Baseball Bat',
      stock: 15,
      price: 30,
      thumbnail: TImages.productImage29,
      description:
          'This is a Product description for Baseball Bat. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      images: [
        TImages.productImage29,
        TImages.productImage28,
        TImages.productImage30,
        TImages.productImage31
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '020',
      title: 'Cricket Bat',
      stock: 15,
      price: 25,
      thumbnail: TImages.productImage30,
      description:
          'This is a Product description for Cricket Bat. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      images: [
        TImages.productImage30,
        TImages.productImage29,
        TImages.productImage28,
        TImages.productImage31
      ],
      // salePrice: 400,
      sku: 'ABR4568',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '021',
      title: 'Tennis Racket',
      stock: 15,
      price: 54,
      thumbnail: TImages.productImage31,
      description:
          'This is a Product description for Tennis Racket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      images: [
        TImages.productImage31,
        TImages.productImage29,
        TImages.productImage30,
        TImages.productImage28
      ],
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '10',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    ///Furniture
    //bedroom
    ProductModel(
      id: '022',
      title: 'Pure Wooden Bed',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage32,
      description:
          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood'),
      images: [
        TImages.productImage43,
        TImages.productImage44,
        TImages.productImage45,
        TImages.productImage46
      ],
      salePrice: 600,
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Black', 'Grey', 'Brown']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 36,
            salePrice: 12.6,
            image: TImages.productImage32,
            description:
                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
            attributeValues: {'Color': 'Brown', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 35,
            image: TImages.productImage45,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 34,
            image: TImages.productImage46,
            attributeValues: {'Color': 'Brown', 'Size': 'EU 30'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 33,
            image: TImages.productImage43,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 32,
            image: TImages.productImage43,
            attributeValues: {'Color': 'Black', 'Size': 'EU 34'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 31,
            image: TImages.productImage44,
            attributeValues: {'Color': 'Grey', 'Size': 'EU 32'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '023',
      title: 'Side Table Lamp',
      stock: 15,
      price: 25,
      thumbnail: TImages.productImage33,
      description:
          'This is a Product description for Side Table Lamp. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '024',
      title: 'Bedroom Sofa',
      stock: 15,
      price: 25,
      thumbnail: TImages.productImage34,
      description:
          'This is a Product description for Bedroom Sofa. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '025',
      title: 'Wardrobe for Bedroom',
      stock: 15,
      price: 56,
      thumbnail: TImages.productImage35,
      description:
          'This is a Product description for Bedroom Wardrobe. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '8', image: TImages.kenwoodLogo, name: 'Kenwood'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '11',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    //Kitchen
    ProductModel(
      id: '026',
      title: 'Kitchen Counter',
      stock: 15,
      price: 1012,
      thumbnail: TImages.productImage36,
      description:
          'This is a Product description for Kitchen Counter. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '027',
      title: 'Dinning Table',
      stock: 15,
      price: 1012,
      thumbnail: TImages.productImage37,
      description:
          'This is a Product description for Dinning Table. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '028',
      title: 'Refrigerator',
      stock: 15,
      price: 987,
      thumbnail: TImages.productImage38,
      description:
          'This is a Product description for Refrigerator. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '2', image: TImages.adidasLogo, name: 'Adidas'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '12',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    //Office
    ProductModel(
      id: '029',
      title: 'Office Chair Red',
      stock: 15,
      price: 150,
      thumbnail: TImages.productImage39,
      description:
          'This is a Product description for Office Chair. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '030',
      title: 'Office Chair White',
      stock: 15,
      price: 140,
      thumbnail: TImages.productImage40,
      description:
          'This is a Product description for Office Chair. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '031',
      title: 'Office Desk Red',
      stock: 15,
      price: 360,
      thumbnail: TImages.productImage41,
      description:
          'This is a Product description for Office Desk. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '032',
      title: 'Office Desk brown',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage42,
      description:
          'This is a Product description for Office Desk. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '9', image: TImages.ikeaLogo, name: 'IKEA'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '13',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),

    ///Electronics
    //Laptops
    ProductModel(
      id: '033',
      title: 'Acer Laptop RAM 8gb to 16gb 512gb to 2tb',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage56,
      description:
          'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      images: [
        TImages.productImage56,
        TImages.productImage47,
        TImages.productImage57,
        TImages.productImage58
      ],
      salePrice: 800,
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Ram', values: ['6', '8', '16']),
        ProductAttributeModel(name: 'SSD', values: ['512', '1 tb', '2 tb']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 400,
            salePrice: 350,
            image: TImages.productImage56,
            description:
                'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
            attributeValues: {'Ram': '6', 'hard': '512'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 450,
            image: TImages.productImage47,
            attributeValues: {'Ram': '8', 'hard': '512'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 470,
            image: TImages.productImage59,
            attributeValues: {'Ram': '8', 'hard': '1 tb'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 500,
            image: TImages.productImage58,
            attributeValues: {'Ram': '16', 'hard': '512'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 650,
            image: TImages.productImage57,
            attributeValues: {'Ram': '16', 'hard': '1 tb'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage59,
            attributeValues: {'Ram': '16', 'hard': '2 tb'}),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '034',
      title: 'Acer Laptop 6gb 1tb',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage48,
      description:
          'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '035',
      title: 'Acer Laptop 6gb 500Gb',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage49,
      description:
          'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '036',
      title: 'Acer Laptop 4gb 500Gb',
      stock: 15,
      price: 400,
      thumbnail: TImages.productImage50,
      description:
          'This is a Product description for Acer Laptop. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '10', image: TImages.acerlogo, name: 'Acer'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '14',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    //Mobiles
    ProductModel(
      id: '037',
      title: 'Iphone 13 pro 512gb',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage51,
      description:
          'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '038',
      title: 'Iphone 14 pro 512gb',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage52,
      description:
          'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '039',
      title: 'Iphone 14 white 512gb',
      stock: 15,
      price: 999,
      thumbnail: TImages.productImage53,
      description:
          'This is a Product description for Iphone. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      // salePrice: 400,1
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '040',
      title: 'Iphone 12, 4 Colors 128gb and 256gb',
      stock: 15,
      price: 950,
      isFeatured: true,
      thumbnail: TImages.productImage70,
      description:
          'This is a Product description for Iphone 12. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '5', image: TImages.appleLogo, name: 'Apple'),
      images: [
        TImages.productImage70,
        TImages.productImage71,
        TImages.productImage72,
        TImages.productImage73
      ],
      salePrice: 800,
      sku: 'ABR4568',
      categoryId: '15',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Green', 'Red', 'Blue', 'Black']),
        ProductAttributeModel(name: 'Storage', values: ['128 gb', '256 gb']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 16,
            price: 400,
            salePrice: 350,
            image: TImages.productImage70,
            description:
                'This is a Product description for Iphone 12. There are more things that can be added but i am just practicing and nothing else.',
            attributeValues: {'Color': 'Red', 'Storage': '128 gb'}),
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 450,
            image: TImages.productImage70,
            attributeValues: {'Color': 'Red', 'Storage': '256 gb'}),
        ProductVariationModel(
            id: '3',
            stock: 14,
            price: 470,
            image: TImages.productImage71,
            attributeValues: {'Color': 'Blue', 'Storage': '128 gb'}),
        ProductVariationModel(
            id: '4',
            stock: 13,
            price: 500,
            image: TImages.productImage71,
            attributeValues: {'Color': 'Blue', 'Storage': '256 gb'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 650,
            image: TImages.productImage72,
            attributeValues: {'Color': 'Green', 'Storage': '128 gb'}),
        ProductVariationModel(
            id: '5',
            stock: 12,
            price: 650,
            image: TImages.productImage72,
            attributeValues: {'Color': 'Green', 'Storage': '256 gb'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage73,
            attributeValues: {'Color': 'Black', 'Storage': '128 gb'}),
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 800,
            image: TImages.productImage73,
            attributeValues: {'Color': 'Black', 'Storage': '256 gb'}),
      ],
      productType: 'ProductType.variable',
    ),

// ProductModel
  ];

  /// Upload  dummy  Categories
  static final List<CategoryModel> categories = [
    CategoryModel(
        id: '1', image: TImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(
        id: '5',
        image: TImages.furnitureIcon,
        name: 'Furniture',
        isFeatured: true),
    CategoryModel(
        id: '2',
        image: TImages.electronicsIcon,
        name: 'Electronics',
        isFeatured: true),
    CategoryModel(
        id: '3', image: TImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(
        id: '4', image: TImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(
        id: '6', image: TImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(
        id: '7',
        image: TImages.cosmeticsIcon,
        name: 'Cosmetics',
        isFeatured: true),
    CategoryModel(
        id: '14',
        image: TImages.jeweleryIcon,
        name: 'Jewelery',
        isFeatured: true),

    ///subcategories
    CategoryModel(
        id: '8', image: TImages.sportIcon, name: 'Sport Shoes', parentId: '1'),
    CategoryModel(
        id: '9', image: TImages.sportIcon, name: 'Track suits', parentId: '1'),
    CategoryModel(
        id: '10',
        image: TImages.sportIcon,
        name: 'Sports Equipments',
        parentId: '1'),
    //furniture
    CategoryModel(
        id: '11',
        image: TImages.furnitureIcon,
        name: 'Bedroom furniture',
        parentId: '5'),
    CategoryModel(
        id: '12',
        image: TImages.furnitureIcon,
        name: 'Kitchen furniture',
        parentId: '5'),
    CategoryModel(
        id: '13',
        image: TImages.furnitureIcon,
        name: 'Office furniture',
        parentId: '5'),
    //electronics
    CategoryModel(
        id: '14',
        image: TImages.electronicsIcon,
        name: 'Laptop',
        parentId: '2'),
    CategoryModel(
        id: '15',
        image: TImages.electronicsIcon,
        name: 'Mobile',
        parentId: '2'),

    CategoryModel(
        id: '16', image: TImages.clothIcon, name: 'Shirts', parentId: '3'),
  ];

  /// -- List of all Brand Categories
  static final List<BrandCategoryModel> brandCategories = [
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '8'),
    BrandCategoryModel(brandId: '1', categoryId: '9'),
    BrandCategoryModel(brandId: '1', categoryId: '10'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '8'),
    BrandCategoryModel(brandId: '2', categoryId: '9'),
    BrandCategoryModel(brandId: '2', categoryId: '10'),
    BrandCategoryModel(brandId: '3', categoryId: '1'),
    BrandCategoryModel(brandId: '3', categoryId: '8'),
    BrandCategoryModel(brandId: '3', categoryId: '9'),
    BrandCategoryModel(brandId: '3', categoryId: '10'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '8'),
    BrandCategoryModel(brandId: '4', categoryId: '9'),
    BrandCategoryModel(brandId: '4', categoryId: '10'),
    BrandCategoryModel(brandId: '5', categoryId: '15'),
    BrandCategoryModel(brandId: '5', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '14'),
    BrandCategoryModel(brandId: '6', categoryId: '3'),
    BrandCategoryModel(brandId: '6', categoryId: '16'),
    BrandCategoryModel(brandId: '7', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '11'),
    BrandCategoryModel(brandId: '8', categoryId: '12'),
    BrandCategoryModel(brandId: '8', categoryId: '13'),
    BrandCategoryModel(brandId: '9', categoryId: '5'),
    BrandCategoryModel(brandId: '9', categoryId: '11'),
    BrandCategoryModel(brandId: '9', categoryId: '12'),
    BrandCategoryModel(brandId: '9', categoryId: '13'),
  ];

  /// -- List of all Product Categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productId: '001', categoryId: '1'),
    ProductCategoryModel(productId: '001', categoryId: '8'),
    ProductCategoryModel(productId: '004', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '3'),
    ProductCategoryModel(productId: '002', categoryId: '16'),
    ProductCategoryModel(productId: '003', categoryId: '3'),
    ProductCategoryModel(productId: '005', categoryId: '1'),
    ProductCategoryModel(productId: '005', categoryId: '8'),
    ProductCategoryModel(productId: '040', categoryId: '2'),
    ProductCategoryModel(productId: '040', categoryId: '15'),
    ProductCategoryModel(productId: '006', categoryId: '2'),
    ProductCategoryModel(productId: '007', categoryId: '4'),
    ProductCategoryModel(productId: '009', categoryId: '1'),
    ProductCategoryModel(productId: '009', categoryId: '8'),
    ProductCategoryModel(productId: '010', categoryId: '1'),
    ProductCategoryModel(productId: '010', categoryId: '8'),
    ProductCategoryModel(productId: '011', categoryId: '1'),
    ProductCategoryModel(productId: '011', categoryId: '8'),
    ProductCategoryModel(productId: '012', categoryId: '1'),
    ProductCategoryModel(productId: '012', categoryId: '8'),
    ProductCategoryModel(productId: '013', categoryId: '1'),
    ProductCategoryModel(productId: '013', categoryId: '8'),

    ProductCategoryModel(productId: '014', categoryId: '1'),
    ProductCategoryModel(productId: '014', categoryId: '9'),
    ProductCategoryModel(productId: '015', categoryId: '1'),
    ProductCategoryModel(productId: '015', categoryId: '9'),
    ProductCategoryModel(productId: '016', categoryId: '1'),
    ProductCategoryModel(productId: '016', categoryId: '9'),
    ProductCategoryModel(productId: '017', categoryId: '1'),
    ProductCategoryModel(productId: '017', categoryId: '9'),

    ProductCategoryModel(productId: '018', categoryId: '1'),
    ProductCategoryModel(productId: '018', categoryId: '10'),
    ProductCategoryModel(productId: '019', categoryId: '1'),
    ProductCategoryModel(productId: '019', categoryId: '10'),
    ProductCategoryModel(productId: '020', categoryId: '1'),
    ProductCategoryModel(productId: '020', categoryId: '10'),
    ProductCategoryModel(productId: '021', categoryId: '1'),
    ProductCategoryModel(productId: '021', categoryId: '10'),

    ProductCategoryModel(productId: '022', categoryId: '5'),
    ProductCategoryModel(productId: '022', categoryId: '11'),
    ProductCategoryModel(productId: '023', categoryId: '5'),
    ProductCategoryModel(productId: '023', categoryId: '11'),
    ProductCategoryModel(productId: '024', categoryId: '5'),
    ProductCategoryModel(productId: '024', categoryId: '11'),
    ProductCategoryModel(productId: '025', categoryId: '5'),
    ProductCategoryModel(productId: '025', categoryId: '11'),

    ProductCategoryModel(productId: '026', categoryId: '5'),
    ProductCategoryModel(productId: '026', categoryId: '12'),
    ProductCategoryModel(productId: '027', categoryId: '5'),
    ProductCategoryModel(productId: '027', categoryId: '12'),
    ProductCategoryModel(productId: '028', categoryId: '5'),
    ProductCategoryModel(productId: '028', categoryId: '12'),

    ProductCategoryModel(productId: '029', categoryId: '5'),
    ProductCategoryModel(productId: '029', categoryId: '13'),
    ProductCategoryModel(productId: '030', categoryId: '5'),
    ProductCategoryModel(productId: '030', categoryId: '13'),
    ProductCategoryModel(productId: '031', categoryId: '5'),
    ProductCategoryModel(productId: '031', categoryId: '13'),
    ProductCategoryModel(productId: '032', categoryId: '5'),
    ProductCategoryModel(productId: '032', categoryId: '13'),

    ProductCategoryModel(productId: '033', categoryId: '2'),
    ProductCategoryModel(productId: '033', categoryId: '14'),
    ProductCategoryModel(productId: '034', categoryId: '2'),
    ProductCategoryModel(productId: '034', categoryId: '14'),
    ProductCategoryModel(productId: '035', categoryId: '2'),
    ProductCategoryModel(productId: '035', categoryId: '14'),
    ProductCategoryModel(productId: '036', categoryId: '2'),
    ProductCategoryModel(productId: '036', categoryId: '14'),

    ProductCategoryModel(productId: '037', categoryId: '2'),
    ProductCategoryModel(productId: '037', categoryId: '15'),
    ProductCategoryModel(productId: '038', categoryId: '2'),
    ProductCategoryModel(productId: '038', categoryId: '15'),
    ProductCategoryModel(productId: '039', categoryId: '2'),
    ProductCategoryModel(productId: '039', categoryId: '15'),
    //040 after product 005

    ProductCategoryModel(productId: '008', categoryId: '2'),
  ];
}
