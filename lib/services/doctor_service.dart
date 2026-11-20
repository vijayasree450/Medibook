import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/doctor.dart';

class DoctorService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Upload doctors to Firebase
  Future<void> addDoctorsToFirestore() async {
    for (final doctor in doctors) {
      await _firestore.collection('doctors').doc(doctor.id).set({
        'name': doctor.name,
        'speciality': doctor.speciality,
        'experience': doctor.experience,
        'rating': doctor.rating,
        'description': doctor.description,
        'imagePath': doctor.imagePath,
      });
    }
  }

  // Get doctors from Firebase`
  Stream<List<Doctor>> getDoctorsStream() {
    return _firestore.collection('doctors').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();

        return Doctor(
          id: doc.id,
          name: data['name']?.toString() ?? '',
          speciality: data['speciality']?.toString() ?? '',
          experience: data['experience']?.toString() ?? '',
          rating: data['rating']?.toString() ?? '',
          description: data['description']?.toString() ?? '',
          imagePath: data['imagePath']?.toString() ?? 'assets/images/doctor${doc.id}.jpg',
        );
      }).toList();
    });
  }
}
