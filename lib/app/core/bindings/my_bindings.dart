import 'package:get/get.dart';

import '../../features/controller/all_list_controller.dart';
import '../../features/controller/detail_controller.dart';

class MyBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllListController>(() => AllListController(),fenix: true);
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}