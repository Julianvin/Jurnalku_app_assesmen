import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jurnalku_app/widgets/dashboard_app_bar.dart';

class ProfilePage extends StatefulWidget {
  final int studentId;

  const ProfilePage({
    super.key,
    required this.studentId,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Map<String, dynamic>? student;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchStudent();
  }

  Future<void> fetchStudent() async {
    final response = await http.get(
      Uri.parse(
        'http://127.0.0.1:8000/api/students/${widget.studentId}',
      ),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      setState(() {
        student = json['data'];
        isLoading = false;
      });
    } else {
      throw Exception('Gagal fetch data siswa');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    const double profileRadius = 45;
    const double positionedBottom = -profileRadius;
    const double spacerHeight = profileRadius + 10;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: const DashboardAppBar(
          titleText: "Profile > Siswa",
        ),
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 160,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage("assets/images/boxis.png"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2),
                        BlendMode.darken,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: positionedBottom,
                  left: 20,
                  child: CircleAvatar(
                    radius: profileRadius,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: profileRadius - 5,
                      backgroundImage: NetworkImage(
                        "http://127.0.0.1:8000/storage/${student!['photo']}",
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: spacerHeight),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student!['nama'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "${student!['nis']} | ${student!['rombel']} | ${student!['rayon']}",
                        style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue.shade800),
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.all(10),
                      ),
                      shape: MaterialStateProperty.all(const CircleBorder()),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TabBar(
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Color(0xFF0056D2),
                unselectedLabelColor: Colors.black54,
                indicatorColor: Color(0xFF0056D2),
                tabs: [
                  Tab(text: "Overview"),
                  Tab(text: "Portfolio"),
                  Tab(text: "Sertifikat"),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                children: [
                  _overviewTab(),
                  _simpleTab("Portfolio belum tersedia"),
                  _simpleTab("Belum ada sertifikat"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _overviewTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _infoRow("Jurusan", student!['jurusan']),
          _infoRow("Rombel", student!['rombel']),
          _infoRow("Rayon", student!['rayon']),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          SizedBox(
            width: 90,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(value),
        ],
      ),
    );
  }

  Widget _simpleTab(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(color: Colors.black54),
      ),
    );
  }
}
