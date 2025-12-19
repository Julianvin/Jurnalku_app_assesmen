import 'package:flutter/material.dart';
import 'package:jurnalku_app/subject_datail.dart';



class GimDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  const GimDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SubjectDetailScreen(data: data); 
  }
}