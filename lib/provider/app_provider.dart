import 'package:flutter/cupertino.dart';

class AppProvider extends ChangeNotifier{
  String appLanguage='en';

  void changeLanguage(String newLanguage){
    if(appLanguage==newLanguage){
      return;
    }
    appLanguage=newLanguage;
    notifyListeners();
  }

}