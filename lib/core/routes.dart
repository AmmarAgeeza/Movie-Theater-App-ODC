import 'package:flutter/material.dart';
import 'package:movie_app_odc/view/screens/home_layout_screen/home_layout_screen.dart';
import 'package:movie_app_odc/view/screens/home_screen/home_screen.dart';

import '../view/screens/checkout_screen/checkout_screen.dart';
import '../view/screens/favorite_screen/favorite_screen.dart';
import '../view/screens/login_screen/login_screen.dart';
import '../view/screens/menu_screen/menu_screen.dart';
import '../view/screens/movie_detail_screen/movie_detail_screen.dart';
import '../view/screens/my_tickets_screen/my_tickets_screen.dart';
import '../view/screens/payment_screen/payment_screen.dart';
import '../view/screens/register_screen/register_screen.dart';
import '../view/screens/reservation_screen/reservation_screen.dart';
import '../view/screens/search_screen/search_screen.dart';
import '../view/screens/splash_screen/splash_screen.dart';
import '../view/screens/view_ticket_screen/view_ticket_screen.dart';
import 'resources/strings_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeLayoutRoute = '/homeLayout';
  static const String homeRoute = '/home';
  static const String myTicketsRoute = '/myTickets';
  static const String viewTicketRoute = '/viewTicket';
  static const String favoriteRoute = '/favorite';
  static const String menuRoute = '/menu';
  static const String searchRoute = '/search';
  static const String movieDetailRoute = '/movieDetail';
  static const String reservationRoute = '/reservation';
  static const String paymentRoute = '/payment';
  static const String checkoutRoute = '/checkout';
}

class RoutesGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) =>  LoginScreen());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.homeLayoutRoute:
        return MaterialPageRoute(builder: (_) => const HomeLayoutScreen());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomePageScreen());
      case Routes.myTicketsRoute:
        return MaterialPageRoute(builder: (_) => const MyTicketsScreen());
        case Routes.viewTicketRoute:
        return MaterialPageRoute(builder: (_) => const ViewTicketScreen());
      case Routes.favoriteRoute:
        return MaterialPageRoute(builder: (_) => const FavoriteScreen());
      case Routes.menuRoute:
        return MaterialPageRoute(builder: (_) => const MenuScreen());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
        case Routes.movieDetailRoute:
        return MaterialPageRoute(builder: (_) => const MovieDetailScreen());
        case Routes.reservationRoute:
        return MaterialPageRoute(builder: (_) => const ReservationScreen());
        case Routes.paymentRoute:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case Routes.checkoutRoute:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRouteFound),
        ),
        body: const Center(
          child: Text(AppStrings.noRouteFound),
        ),
      ),
    );
  }
}
