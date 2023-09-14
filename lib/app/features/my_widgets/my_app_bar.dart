import 'package:flutter/material.dart';
import 'package:sample_proj/app/utils/my_strings.dart';

class MyAppBar extends AppBar{
   MyAppBar({super.key}):super(
    elevation: 2.0,
     backgroundColor: Colors.white,
     foregroundColor: Colors.white,
     title: const Text(fitBasix,style: TextStyle(color: Colors.green,fontSize: 18.0,
     fontWeight: FontWeight.bold),),
     centerTitle: true,
  );

}