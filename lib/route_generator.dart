import 'package:flutter/material.dart';
import 'package:novus_trade_v1/screens/addCustomer/add_customer_screen.dart';
import 'package:novus_trade_v1/screens/brands/brand.dart';
import 'package:novus_trade_v1/screens/cart/list_item_cart.dart';
import 'package:novus_trade_v1/screens/category/category_detail_screen.dart';
import 'package:novus_trade_v1/screens/categorys/category_screen.dart';
import 'package:novus_trade_v1/screens/detail_product/detail_product_screen.dart';
import 'package:novus_trade_v1/screens/home_screen.dart';
import 'package:novus_trade_v1/screens/onboarding.dart';
import 'package:novus_trade_v1/screens/profie_screen/profile_screen.dart';
import 'package:novus_trade_v1/screens/signin.dart';
import 'package:novus_trade_v1/screens/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/':
        return MaterialPageRoute(builder: (_) => OnBoardingWidget());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => SignInWidget());
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/detail_product':
        return MaterialPageRoute(
            builder: (_) => DetailProductScreen(
                  product: args,
                ));
      case '/profile':
        return MaterialPageRoute(builder: (_) => ProfileWidget());
      case '/categories':
        return MaterialPageRoute(builder: (_) => CategorysScreen());
      case '/categories_detail':
        return MaterialPageRoute(builder: (_) => CategoryDetail());
      case '/brands':
        return MaterialPageRoute(builder: (_) => BrandsScreen());
      case '/cart':
        return MaterialPageRoute(builder: (_) => CartWidget());
      case '/add_customer':
        return MaterialPageRoute(builder: (_) => AddCustomerScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Error"),
        ),
        body: Center(
          child: Text("Error"),
        ),
      );
    });
  }
}
