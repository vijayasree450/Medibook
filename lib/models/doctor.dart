class Doctor {
  final String id;
  final String name;
  final String speciality;
  final String experience;
  final String rating;
  final String description;
  final String imagePath;

  Doctor({
    required this.id,
    required this.name,
    required this.speciality,
    required this.experience,
    required this.rating,
    required this.description,
    required this.imagePath,
  });
}

final List<Doctor> doctors = [
  Doctor(
    id: '1',
    name: 'Dr. Sarah Johnson',
    speciality: 'Cardiologist',
    experience: '8 years',
    rating: '4.9',
    description: 'Experienced heart specialist.',
    imagePath: 'assets/images/doctor1.jpg',
  ),
  Doctor(
    id: '2',
    name: 'Dr. Michael Smith',
    speciality: 'Dentist',
    experience: '6 years',
    rating: '4.8',
    description: 'Professional dental care specialist.',
    imagePath: 'assets/images/doctor2.jpg',
  ),
  Doctor(
    id: '3',
    name: 'Dr. Emily Wilson',
    speciality: 'Dermatologist',
    experience: '5 years',
    rating: '4.7',
    description: 'Skin care and treatment specialist.',
    imagePath: 'assets/images/doctor3.jpg',
  ),
];
