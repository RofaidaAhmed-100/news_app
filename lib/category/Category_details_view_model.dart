import 'package:flutter/widgets.dart';
import 'package:news_app/api/api_manager.dart';

import '../model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier{
  List<Source>? sourceList;
  String? errorMessage;
  void getSources(String categoryID)async {
    try {
      var response = await ApiManager.getSources(categoryID);
      if(response?.status=='error'){
        errorMessage= response!.message;
      }else{
        sourceList=response!.sources;
      }
    }catch(e){
      errorMessage='Error loading source List';
    }
  }

}