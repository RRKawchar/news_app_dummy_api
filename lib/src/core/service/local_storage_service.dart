import 'package:news_app_dummy_api/src/core/enums/app_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService{

   static Future<void> saveData({required LocalStorageKey key,dynamic value})async{
      SharedPreferences preferences = await SharedPreferences.getInstance();
      await preferences.setString(key.toString(), value);
   }


   static Future<String> getData({required LocalStorageKey key})async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      String? result=preferences.getString(key.toString());
      return result!;
   }


  static Future<void> removeData({required LocalStorageKey key})async{
      SharedPreferences preferences=await SharedPreferences.getInstance();
      preferences.remove(key.toString());
   }
}