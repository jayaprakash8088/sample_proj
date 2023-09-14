import 'package:flutter/material.dart';
import 'package:sample_proj/app/features/model/response_model/all_list_response_model.dart';
import 'package:sample_proj/app/features/my_widgets/my_app_bar.dart';

import '../my_widgets/exercise_card.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.responseModel});
   final AllListResponseModel? responseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body:  ExerciseCard(
          responseModel:
          responseModel!,fromDetail: true),
    );
  }
}
