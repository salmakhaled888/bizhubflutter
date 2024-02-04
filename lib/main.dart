import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:helloworld/cubit/add_product/add_product_cubit.dart';
import 'package:helloworld/cubit/business_type/business_type_cubit.dart';
import 'package:helloworld/cubit/category/category_cubit.dart';
import 'package:helloworld/cubit/products/product_cubit.dart';
import 'package:helloworld/cubit/ratings/rating_cubit.dart';
import 'package:helloworld/cubit/shop_category/shop_category_cubit.dart';
import 'package:helloworld/cubit/sign_in/signin_cubit.dart';
import 'package:helloworld/cubit/single_category/single_category_cubit.dart';
import 'package:helloworld/cubit/single_product/single_product_cubit.dart';
import 'cubit/all_products/all_products_cubit.dart';
import 'cubit/customer_signup/customer_sign_up_cubit.dart';
import 'cubit/seller_shop/add_seller_shop_cubit.dart';
import 'cubit/seller_signup/seller_sign_up_cubit.dart';
import 'cubit/signup/signup_cubit.dart';
import 'screens/continue_as.dart';
import 'screens/having_biz.dart';
import 'screens/home.dart';
import 'screens/seller_home.dart';
import 'screens/onboarding.dart';
import 'screens/onboarding2.dart';
import 'screens/onboarding3.dart';
import 'screens/splash.dart';
import 'screens/sign_in.dart';
import 'screens/sign_up.dart';
import 'screens/reset_pass.dart';
import 'screens/step0.dart';
import 'screens/step1.dart';
import 'screens/step2.dart';
import 'screens/step3.dart';
import 'screens/step4.dart';
import 'screens/step5.dart';
import 'screens/search.dart';
import 'screens/favourite.dart';
import 'screens/cart.dart';
import 'screens/user_profile.dart';
import 'screens/seller_profile.dart';
import 'screens/location.dart';
import 'screens/product_list.dart';
import 'screens/payment.dart';
import 'screens/product.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF383838),
      ),
      initialRoute: '/', // Set initial route to '/'
      routes: {
        '/': (context) => const SplashScreen(), // Define SplashScreen as the initial route
        '/home': (context) =>  MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => CategoryCubit()),
              BlocProvider(create: (context) => AllProductsCubit()),
            ],
            child: HomeScreen()),
      '/sellerHome': (context) =>  MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => CategoryCubit()),
            BlocProvider(create: (context) => AllProductsCubit()),
          ],
          child: SellerHomeScreen()),
        '/onboarding': (context) => const OnboardingScreen(),
        '/onboarding2': (context) => const Onboarding2Screen(),
        '/onboarding3': (context) => const Onboarding3Screen(),
        '/havingBiz': (context) => const BusinessQuestionScreen(),
        '/signin': (context) => BlocProvider(
                    create: (context) => SigninCubit(),
                    child: SignInScreen(),
                  ),
        '/signup': (context) => BlocProvider(
              create: (context) => SignupCubit(),
              child: SignUpScreen(),
            ),
        '/resetPass': (context) => ResetPasswordScreen(),
        '/continueAs': (context) => const ContinueAsScreen(),
        '/step0': (context) => MultiBlocProvider(
                providers: [
                  BlocProvider(create: (context) => SellerSignUpCubit()),
                  BlocProvider(create: (context) => CustomerSignUpCubit())
                ],
                child: const Step0Screen()),
        '/step1': (context) =>
            BlocProvider(
              create: (context) => AddSellerShopCubit(),
              child: Step1Screen(),
            ),
        '/step2': (context) => BlocProvider(
                  create: (context) => ShopCategoryCubit(),
                  child: Step2Screen(),
                ),
        '/step3': (context) =>  BlocProvider(
                        create: (context) => BusinessTypeCubit(),
                        child: Step3Screen(),
                      ),
        '/step4': (context) => const Step4Screen(),
        '/step5': (context) => BlocProvider(
                    create: (context) => AddProductCubit(),
                    child: Step5Screen(),
                  ),
        '/sellerProfile': (context) => SellerProfileScreen(),
        '/userProfile': (context) => UserProfileScreen(),
        '/location': (context) => LocationScreen(),
        '/productList': (context) => ProductListScreen(),
        '/product': (context) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => SingleProductCubit()),
              BlocProvider(create: (context) => SingleCategoryCubit())
            ],
            child: ProductDetailsScreen()),
        '/search': (context) => BlocProvider(
                  create: (context) => ProductCubit(),
                  child: SearchScreen(),
                ),
        '/favourite': (context) => FavouriteScreen(),
        '/cart': (context) => CartScreen(),
        '/payment': (context) => PaymentScreen(),
      },
    );
  }
}
