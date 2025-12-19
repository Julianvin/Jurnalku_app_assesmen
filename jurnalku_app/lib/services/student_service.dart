import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/student_model.dart';

class StudentService {
  static const String baseUrl = 'http://127.0.0.1:8000/api/students';

  static Future<List<Student>> fetchStudents() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final List data = jsonBody['data'];

      return data.map((e) => Student.fromJson(e)).toList();
    } else {
      throw Exception('Gagal mengambil data siswa');
    }
  }
}
