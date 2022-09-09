

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm/repository/auth_repostiry.dart';
import 'package:mvvm/utilis/routes/routes_name.dart';
import 'package:mvvm/utilis/utils.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepositry();
  bool _loading = false;
  bool get loading => _loading;

 //
  bool _signupLoading =false;
  bool get SingUpLoading => _signupLoading;


  setSignUpLoading(bool value){
    _loading = value;
    notifyListeners();
  }
  //

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data,BuildContext  context)async{
    setLoading(true);
    _myRepo.loginapi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("Login Succesfully", context);
      Navigator.pushNamed(context, RoutesName.home);
       if(kDebugMode){
         print(value.toString());
       }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){

        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }

  Future<void> SignUpApi(dynamic data,BuildContext  context)async{
    setSignUpLoading(true);
    _myRepo.SignupApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage("SignuP Succesfully", context);
      Navigator.pushNamed(context, RoutesName.home);
      if(kDebugMode){
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if(kDebugMode){

        Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }

    });
  }
}