import 'package:flutter/material.dart';

class Fields extends StatelessWidget {
  const Fields({super.key, required this.name, required this.field});
  final String name;
  final String field;
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name??'',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.black)),
          Text(field??'',style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 14.0,color: Colors.black)),
        ],
      ),
    );
  }
}
