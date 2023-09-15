import 'package:flutter/material.dart';
import 'package:sample_proj/app/features/model/response_model/all_list_response_model.dart';
import 'package:sample_proj/app/features/my_widgets/fields_widget.dart';

import '../../utils/my_strings.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({super.key, required this.responseModel, required this.fromDetail});
   final bool fromDetail;
  final AllListResponseModel responseModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      borderOnForeground: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(responseModel.gifUrl,
              loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null ?
                    loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
           Visibility(
               visible: fromDetail,
               child: Column(
             children: [
               Fields(name: name, field: responseModel.name),
               Fields(name: body, field: responseModel.bodyPart),
               Fields(name: equipment, field: responseModel.equipment),
               Fields(name: target, field: responseModel.target)
             ],
           ))
          ],
        ),
      ),
    );
  }
}
