import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:news_app_dummy_api/src/core/helpers/helper.dart';
import 'package:news_app_dummy_api/src/core/service/connectivity_service.dart';
class ApiHandler{


  static Future<http.Response>getRequest({required String api,params})async{

    if(!await ConnectivityService.hasInternet){
      throw "No Internet";
    }

    kPrint("You Hit : $api");
    kPrint("Request parameters : $params");


    var headers={
      'Content-Type': 'application/json'
    };
    http.Response response=await http.get(
        Uri.parse(api).replace(queryParameters: params),
        headers: headers,
    );

    return response;

  }


  static handleResponse(http.Response response)async{
    try{
      if(!await ConnectivityService.hasInternet){
        return "No Internet";
      }
      if(response.statusCode>=200 && response.statusCode<=210){
        kPrint("Success Status Code : ${response.statusCode}");
        kPrint("Success Response Body : ${response.body}");

        if(response.body.isNotEmpty){
          return json.decode(response.body);
        }else{
          return response.body;
        }

      }else if(response.statusCode==400){
        kPrint("Error status Code: ${response.statusCode}");
        kPrint("Error Response Body: ${response.body}");
        throw 'Bad Request';
      }else if(response.statusCode==401){
        kPrint("Error status Code: ${response.statusCode}");
        kPrint("Error Response Body: ${response.body}");

        String msg="";
        if(response.body.isNotEmpty){
          if(jsonDecode(response.body)['error']!=null){
            msg=jsonDecode(response.body)['error'];
          }
        }
        throw msg;
      }else if(response.statusCode==500){
        kPrint("Error status Code: ${response.statusCode}");
        kPrint("Error Response Body: ${response.body}");
        throw "Internal Server Error";
      }else{
        kPrint("Error status Code: ${response.statusCode}");
        kPrint("Error Response Body: ${response.body}");
        throw "Unknown Response";
      }
    }on SocketException catch(_){
      throw "No Internet";
    }on FormatException catch(_){
      throw "Bad Response";
    }catch(e){
      kPrint(e.toString());
      throw e.toString();
    }
  }
}