import 'package:flutter/material.dart';
import '../models/doctor.dart';
import 'booking_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final Doctor doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Doctor Details')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 55,
                backgroundColor: const Color(0xFFEAE3FF),
                backgroundImage: doctor.imagePath.isNotEmpty
                    ? AssetImage(doctor.imagePath)
                    : null,
                child: doctor.imagePath.isEmpty
                    ? const Icon(Icons.person, size: 65, color: Color(0xFF7655D9))
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                doctor.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Center(child: Text(doctor.speciality)),
            const SizedBox(height: 25),
            Text('Experience: ${doctor.experience}'),
            const SizedBox(height: 12),
            Text('Rating: ⭐ ${doctor.rating}'),
            const SizedBox(height: 20),
            const Text(
              'About Doctor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(doctor.description),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF7655D9),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookingScreen(doctor: doctor),
                    ),
                  );
                },
                child: const Text('Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
