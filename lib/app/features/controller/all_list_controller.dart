import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_proj/app/core/api_service/repository.dart';

import '../model/response_model/all_list_response_model.dart';

class AllListController extends GetxController {
  final Repository _repository = Repository();
  var exerciseList = RxList<AllListResponseModel>().obs;
  RxBool isLoading = false.obs;

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
      changeLoading();
    } else {
      exerciseList.value.addAll([]);
    }
  }

  void changeLoading() {
    isLoading.value = !isLoading.value;
    update();
  }
}
