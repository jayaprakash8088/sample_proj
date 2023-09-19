import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_proj/app/core/api_service/repository.dart';

import '../model/response_model/all_list_response_model.dart';

class AllListController extends GetxController {
  final Repository _repository = Repository();
  var exerciseList = RxList<AllListResponseModel>().obs;
  var exerciseList1 = RxList<AllListResponseModel>().obs;
  RxBool isLoading = false.obs;
   int pos=0;
   int maxPos=8;
  @override
  void onInit() {
    fetchAllList();
    super.onInit();
  }

  void fetchAllList() async {
    changeLoading();
    dynamic response = await _repository.getAllExercise();
    if (response != null) {
      exerciseList.value.addAll(List<AllListResponseModel>.from(json
          .decode(response)
          .map((x) => AllListResponseModel.fromJson(x))));
       loadList();
      changeLoading();
    } else {
      exerciseList.value.addAll([]);
    }
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }
  void loadList(){
   for(int i=pos;i<exerciseList.value.length;i++){
     exerciseList1.value.add(exerciseList.value[i]);
     if(i+1==maxPos){
       pos=i+1;
       break;}
   }
  }
}
