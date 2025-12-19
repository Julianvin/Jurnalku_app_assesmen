// mobile_detail.dart
import 'package:flutter/material.dart';
import 'package:jurnalku_app/subject_datail.dart';


class MobileDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  const MobileDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return SubjectDetailScreen(data: data); 
  }
}