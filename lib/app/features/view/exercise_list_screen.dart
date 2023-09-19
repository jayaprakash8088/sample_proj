import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_proj/app/features/controller/all_list_controller.dart';
import 'package:sample_proj/app/features/my_widgets/exercise_card.dart';
import 'package:sample_proj/app/features/my_widgets/fields_widget.dart';
import 'package:sample_proj/app/features/my_widgets/my_app_bar.dart';
import 'package:sample_proj/app/features/view/detail_screen.dart';

import '../../utils/my_strings.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    final allListController = Get.put(AllListController());
    ScrollController scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.position.pixels) {
        allListController.maxPos += 5;
        allListController.loadList();
      }
    });

    return Scaffold(
      appBar: MyAppBar(),
      body: Obx(() =>
      allListController.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : allListController.exerciseList1.value.isEmpty
          ? const Text(nothing)
          : ListView.separated(
          controller: scrollController,
          separatorBuilder: (context, index) {
            return const Divider(
              height: 2.0,
              color: Colors.black,
            );
          },
          scrollDirection: Axis.vertical,
          // shrinkWrap: true,
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: allListController.exerciseList1.value.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () =>
                    Get.to(() =>
                        DetailScreen(
                            responseModel:
                            allListController.exerciseList1.value[index])),
                child: SizedBox(
                  // child: ExerciseCard(
                  //     responseModel:
                  //     allListController.exerciseList.value[index],
                  //     fromDetail: false),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Fields(
                          name: name,
                          field: allListController
                              .exerciseList1.value[index].name),
                      Fields(
                          name: body,
                          field: allListController
                              .exerciseList1.value[index].bodyPart),
                      Fields(
                          name: name,
                          field: allListController
                              .exerciseList1.value[index].id),
                    ],
                  ),
                ),
              ),
            );
          })),
    );
  }


}