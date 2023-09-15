import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_proj/app/core/bindings/my_bindings.dart';
import 'package:sample_proj/app/features/view/detail_screen.dart';
import 'package:sample_proj/app/features/view/exercise_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sample Project',
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindings(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const ExerciseList()),
        GetPage(name: '/detail', page: () =>  const DetailScreen(responseModel:null,))
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}


