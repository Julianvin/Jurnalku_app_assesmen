import 'package:flutter/material.dart';

class SubjectDetailScreen extends StatelessWidget {
  final Map<String, dynamic> data;
  const SubjectDetailScreen({super.key, required this.data});
  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case "disetujui":
      case "selesai":
        return Colors.green.shade700;
      case "pending":
        return Colors.orange.shade700;
      case "ditolak":
        return Colors.red.shade700;
      default:
        return Colors.black87;
    }
  }

  
  Widget _buildDetailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          const Divider(height: 1, color: Colors.black12), 
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(data['status']);

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail ${data['subjectTitle']}"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data['subjectTitle'],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Kompetensi dan materi pembelajaran",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Divider(height: 30, thickness: 1.5),

         
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12.withOpacity(0.08),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ExpansionTile(
              
                title: Text(
                  data['detailTitle'],
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                
                
                initiallyExpanded: false, 
                
                tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), 

              
                children: [
                  const Divider(height: 1, thickness: 1.5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildDetailRow("Kompetensi", data['competency']),
                        _buildDetailRow("Guru", data['teacher']),
                        _buildDetailRow("Tanggal", data['date']),
                        _buildDetailRow("Status", data['status'], valueColor: statusColor),
                        _buildDetailRow("Catatan Guru", data['teacherNote']),
                        _buildDetailRow("Catatan Siswa", data['studentNote']),
                        
                        const SizedBox(height: 8), 
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}