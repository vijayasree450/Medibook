import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/appointment.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Appointments')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .orderBy('createdAt', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          List<Appointment> appointments = [];

          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            appointments = snapshot.data!.docs.map((doc) {
              final data = doc.data();
              return Appointment(
                doctorName: data['doctorName'] ?? '',
                speciality: data['speciality'] ?? '',
                date: data['date'] ?? '',
                time: data['time'] ?? '',
              );
            }).toList();
          } else {
            // fallback to local appointments
            appointments = AppointmentStore.appointments;
          }

          if (appointments.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.calendar_month, size: 65, color: Colors.grey),
                  SizedBox(height: 12),
                  Text('No appointments yet'),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: appointments.length,
            itemBuilder: (context, index) {
              final appointment = appointments[index];

              return Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.only(bottom: 15),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFFEAE3FF),
                    child: Icon(Icons.person, color: Color(0xFF7655D9)),
                  ),
                  title: Text(
                    appointment.doctorName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${appointment.speciality}\n'
                    '${appointment.date} • ${appointment.time}',
                  ),
                  isThreeLine: true,
                  trailing: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
