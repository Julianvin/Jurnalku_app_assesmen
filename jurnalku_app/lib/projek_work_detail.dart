// projek_work_detail.dart
import 'package:flutter/material.dart';
import 'package:jurnalku_app/subject_datail.dart';



class ProjekWorkDetail extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProjekWorkDetail({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Cukup gunakan widget SubjectDetailScreen untuk menampilkan data
    return SubjectDetailScreen(data: data); 
  }
}