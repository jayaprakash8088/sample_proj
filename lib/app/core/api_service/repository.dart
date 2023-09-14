import 'package:flutter/material.dart';
import 'package:sample_proj/app/core/api_service/api_client.dart';
import 'package:sample_proj/app/utils/my_strings.dart';

class Repository{
  final ApiClient _apiClient=ApiClient();
  Future getAllExercise()async{
    try{
      dynamic response=await _apiClient.getAPI(allExercise);
      if(response!=null){
        return response;
      }else{
        return null;
      }
    }catch(e){debugPrint(e.toString());}
  }
}