import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_proj/app/features/controller/all_list_controller.dart';
import 'package:sample_proj/app/features/my_widgets/exercise_card.dart';
import 'package:sample_proj/app/features/my_widgets/my_app_bar.dart';
import 'package:sample_proj/app/features/view/detail_screen.dart';

import '../../utils/my_strings.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    final allListController = Get.put(AllListController());
    return Scaffold(
      appBar: MyAppBar(),
      body: Obx(() => allListController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : allListController.exerciseList.value.isEmpty?
      const Text(nothing):
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(()=>DetailScreen(
                  responseModel:
                  allListController.exerciseList.value[index])),
              child: SizedBox(
                child: ExerciseCard(
                    responseModel:
                    allListController.exerciseList.value[index],
                    fromDetail: false),
              ),
            );
          })),
    );
  }
}
