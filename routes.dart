import 'package:flutter/material.dart';
import 'package:mvvm/utilis/routes/routes_name.dart';
import '../../view/Login_view.dart';
import '../../view/Signup.dart';
import '../../view/home_view.dart';

class Routes{
  static  Route<dynamic> generateRoute(RouteSettings setting){

    switch(setting.name){
      case RoutesName.home:
        return MaterialPageRoute(builder:(BuildContext context)=> const HomeView());

      case RoutesName.login:
        return MaterialPageRoute(builder:(BuildContext context)=> const LoginView());


      case RoutesName.signup:
        return MaterialPageRoute(builder:(BuildContext context)=> const SignUp());

      default:
          return MaterialPageRoute(builder:(_)
          {
            return Scaffold(
              body: Center(
                child: Text("no routes defined"),
              ),
            );
          } );
          }
  }
}