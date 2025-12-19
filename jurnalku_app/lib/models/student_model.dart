class Student {
  final int id;
  final int nis;
  final String nama;
  final String rombel;
  final String rayon;
  final String photo;

  Student({
    required this.id,
    required this.nis,
    required this.nama,
    required this.rombel,
    required this.rayon,
    required this.photo,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      nis: json['nis'],
      nama: json['nama'],
      rombel: json['rombel'],
      rayon: json['rayon'],
      photo: json['photo'],
    );
  }
}
