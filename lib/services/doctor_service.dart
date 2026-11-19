import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/doctor.dart';

class DoctorService {
  FirebaseFirestore? _firestoreInstance;

  FirebaseFirestore? get _firestore {
    try {
      if (Firebase.apps.isNotEmpty) {
        return _firestoreInstance ??= FirebaseFirestore.instance;
      }
    } catch (_) {}
    return null;
  }

  Future<void> addDoctorsToFirestore() async {
    final firestore = _firestore;
    if (firestore == null) {
      throw Exception('Firebase is not initialized');
    }

    for (final doctor in doctors) {
      await firestore.collection('doctors').doc(doctor.id).set({
        'name': doctor.name,
        'speciality': doctor.speciality,
        'experience': doctor.experience,
        'rating': doctor.rating,
        'description': doctor.description,
      });
    }
  }

  Stream<List<Doctor>> getDoctorsStream() {
    try {
      final firestore = _firestore;
      if (firestore != null) {
        return firestore.collection('doctors').snapshots().map((snapshot) {
          if (snapshot.docs.isEmpty) {
            return doctors;
          }
          return snapshot.docs.map((doc) {
            final data = doc.data();
            return Doctor(
              id: doc.id,
              name: data['name'] ?? '',
              speciality: data['speciality'] ?? '',
              experience: data['experience'] ?? '',
              rating: data['rating'] ?? '',
              description: data['description'] ?? '',
            );
          }).toList();
        });
      }
    } catch (_) {}
    return Stream.value(doctors);
  }
}
