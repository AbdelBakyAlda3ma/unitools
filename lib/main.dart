import 'package:flutter/material.dart';
import 'package:unitools/core/common/storage.dart';
import 'package:unitools/views/add_data_view.dart';
import 'package:unitools/views/add_item_view.dart';
import 'package:unitools/views/auth_verification_screen.dart';
import 'package:unitools/views/forgot_password_screen.dart';
import 'package:unitools/views/home_page_view.dart';
import 'package:unitools/views/my_favourite_view.dart';
import 'package:unitools/views/sign_in_screen.dart';
import 'package:unitools/views/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppSharedPreferences.initialSharedPreference();
  runApp(const UniTools());
}

class UniTools extends StatelessWidget {
  const UniTools({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: HomePage.routeName,
        debugShowCheckedModeBanner: false,
        routes: {
          AuthVerificationScreen.routeName: (context) =>
              const AuthVerificationScreen(),
          ForgotPasswordScreen.routeName: (context) =>
              const ForgotPasswordScreen(),
          SignInScreen.routeName: (context) => const SignInScreen(),
          SignUpScreen.routeName: (context) => const SignUpScreen(),
          HomePage.routeName: (context) => const HomePage(),
          AddDataView.routeName: (context) => const AddDataView(),
          AddItemView.routeName: (context) => const AddItemView(),
          MyFavouriteView.routeName: (context) => const MyFavouriteView(),
        });
  }
}
