import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/check_out_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => WelcomeScreen(),
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/dashboard': (context) => DashboardScreen(),
  '/profile': (context) => ProfileScreen(),
  '/cart': (context) => CartScreen(),
  '/check_out': (context) => CheckOutScreen(),
};
