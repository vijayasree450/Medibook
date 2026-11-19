class Appointment {
  final String doctorName;
  final String speciality;
  final String date;
  final String time;

  Appointment({
    required this.doctorName,
    required this.speciality,
    required this.date,
    required this.time,
  });
}

// Temporary local appointment storage
class AppointmentStore {
  static final List<Appointment> appointments = [];
}
