import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:t_store/features/shop/screen/wishlist/wishlist.dart';
import 'package:t_store/navigation_menu.dart';
import 'package:t_store/routes/routes.dart';

import '../features/authendication/screens/login/login.dart';
import '../features/authendication/screens/onBoarding/onboarding.dart';
import '../features/authendication/screens/password_configration/forget_password.dart';
import '../features/authendication/screens/signup/SignUp.dart';
import '../features/authendication/screens/signup/verify_email.dart';
import '../features/personalization/screens/address/address.dart';
import '../features/personalization/screens/profile/profile.dart';
import '../features/personalization/screens/settings/settings.dart';
import '../features/shop/screen/cart/cart.dart';
import '../features/shop/screen/checkout/checkout.dart';
import '../features/shop/screen/home/home_screen.dart';
import '../features/shop/screen/orders/order.dart';
import '../features/shop/screen/product_review/product_review.dart';
import '../features/shop/screen/store/store.dart';

class AppRoutes {
  static final pages = [
  GetPage(name: TRoutes.navigation, page: () => const NavigationMenu()),
  GetPage(name: TRoutes.home, page: () => const HomeScreen()),
  GetPage(name: TRoutes.store, page: () => const StoreScreen()),
  GetPage(name: TRoutes.favourites, page: () => const FavoriteScreen()),
  GetPage(name: TRoutes.settings, page: () => const SettingScreen()),
  GetPage(name: TRoutes.productReviews, page: () => const ProductReviewScreen()),
  GetPage(name: TRoutes.order, page: () => const OrderScreen()),
  GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
  GetPage(name: TRoutes.cart, page: () => const CartScreen()),
  GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
  GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
  GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
  GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
  GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
  GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: TRoutes.onBoarding, page: () => const OnBoardingScreen())

// Add more GetPage entries as needed
  ];
}
