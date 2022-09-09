import 'package:mvvm/data/network/NetworkApiServies.dart';
import 'package:mvvm/data/network/baseapiservices.dart';
import 'package:mvvm/resources/app_url.dart';

class  AuthRepositry{

  BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginapi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);
    }
    catch(e){
      throw e;
    }
  }


  Future<dynamic> SignupApi(dynamic data) async{
    try{
      dynamic response = await _apiServices.getPostApiResponse(AppUrl.registerUrl, data);
    }
    catch(e){
      throw e;
    }
  }


}