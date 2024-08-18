import 'package:flutter/foundation.dart';

kPrint(dynamic msg){
  if(kDebugMode){
    print(msg);
  }
}