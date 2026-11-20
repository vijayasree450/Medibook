// import 'package:flutter/material.dart';
// import '../models/doctor.dart';
// import '../services/doctor_service.dart';
// import '../widgets/category_item.dart';
// import '../widgets/doctor_card.dart';
// import 'appointments_screen.dart';
// import 'doctor_details_screen.dart';
// import 'profile_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   final DoctorService _doctorService = DoctorService();
//   String _searchQuery = '';
//   bool _isUploading = false;
//   int _selectedIndex = 0;

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   Future<void> _uploadDoctors() async {
//     setState(() => _isUploading = true);

//     try {
//       await _doctorService.addDoctorsToFirestore();

//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Doctors synced to Firebase successfully!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } catch (e) {
//       if (!mounted) return;
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Sync failed: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     } finally {
//       if (mounted) {
//         setState(() => _isUploading = false);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     const primaryColor = Color(0xFF7655D9);

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFFF8F7FC),
//         elevation: 0,
//         title: const Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Hello, Welcome 👋',
//               style: TextStyle(fontSize: 13, color: Colors.grey),
//             ),
//             SizedBox(height: 3),
//             Text(
//               'Find Your Doctor',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 22,
//                 color: Colors.black,
//               ),
//             ),
//           ],
//         ),
//         actions: [
//           IconButton(
//             icon: const CircleAvatar(
//               radius: 20,
//               backgroundColor: Color(0xFFEAE3FF),
//               child: Icon(Icons.person, color: primaryColor, size: 24),
//             ),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (_) => const ProfileScreen()),
//               );
//             },
//           ),
//           const SizedBox(width: 8),
//         ],
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 10),

//             // Search Bar
//             TextField(
//               controller: _searchController,
//               onChanged: (val) {
//                 setState(() => _searchQuery = val.trim().toLowerCase());
//               },
//               decoration: InputDecoration(
//                 hintText: 'Search doctors...',
//                 prefixIcon: const Icon(Icons.search, color: primaryColor),
//                 suffixIcon: _searchQuery.isNotEmpty
//                     ? IconButton(
//                         icon: const Icon(Icons.clear),
//                         onPressed: () {
//                           _searchController.clear();
//                           setState(() => _searchQuery = '');
//                         },
//                       )
//                     : null,
//                 filled: true,
//                 fillColor: Colors.white,
//                 contentPadding: const EdgeInsets.symmetric(vertical: 14),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                   borderSide: BorderSide.none,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 20),

//             // Banner
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 color: primaryColor,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Your Health Matters!',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 21,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Book appointments with the best doctors.',
//                     style: TextStyle(color: Colors.white70, fontSize: 13),
//                   ),
//                   const SizedBox(height: 15),
//                   ElevatedButton(
//                     onPressed: () {
//                       if (doctors.isNotEmpty) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) =>
//                                 DoctorDetailsScreen(doctor: doctors.first),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.white,
//                       foregroundColor: primaryColor,
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25),
//                       ),
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 10,
//                       ),
//                     ),
//                     child: const Text(
//                       'Book Appointment',
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             // Specialities
//             const Text(
//               'Specialities',
//               style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 15),

//             SizedBox(
//               height: 100,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: const [
//                   CategoryItem(icon: Icons.favorite, name: 'Cardiology'),
//                   CategoryItem(icon: Icons.face, name: 'Dentist'),
//                   CategoryItem(icon: Icons.remove_red_eye, name: 'Eye Care'),
//                   CategoryItem(icon: Icons.child_care, name: 'Pediatric'),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 25),

//             // Top Doctors Header
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Text(
//                   'Top Doctors',
//                   style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//                 ),
//                 TextButton.icon(
//                   onPressed: _isUploading ? null : _uploadDoctors,
//                   icon: _isUploading
//                       ? const SizedBox(
//                           width: 14,
//                           height: 14,
//                           child: CircularProgressIndicator(strokeWidth: 2),
//                         )
//                       : const Icon(Icons.cloud_upload, size: 16),
//                   label: Text(
//                     _isUploading ? 'Syncing...' : 'Sync Firebase',
//                     style: const TextStyle(color: primaryColor, fontSize: 13),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 10),

//             // Doctors Stream/List
//             StreamBuilder<List<Doctor>>(
//               stream: _doctorService.getDoctorsStream(),
//               builder: (context, snapshot) {
//                 final list = snapshot.data ?? doctors;
//                 final filteredDoctors = list.where((d) {
//                   if (_searchQuery.isEmpty) return true;
//                   return d.name.toLowerCase().contains(_searchQuery) ||
//                       d.speciality.toLowerCase().contains(_searchQuery);
//                 }).toList();

//                 if (filteredDoctors.isEmpty) {
//                   return const Padding(
//                     padding: EdgeInsets.symmetric(vertical: 30),
//                     child: Center(
//                       child: Text(
//                         'No doctors found',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ),
//                   );
//                 }

//                 return ListView.builder(
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   itemCount: filteredDoctors.length,
//                   itemBuilder: (context, index) {
//                     final doctor = filteredDoctors[index];
//                     return DoctorCard(
//                       doctor: doctor,
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (_) => DoctorDetailsScreen(doctor: doctor),
//                           ),
//                         );
//                       },
//                     );
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//       ),

//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         selectedItemColor: primaryColor,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() => _selectedIndex = index);
//           if (index == 1) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const AppointmentsScreen()),
//             ).then((_) {
//               if (mounted) setState(() => _selectedIndex = 0);
//             });
//           } else if (index == 3) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (_) => const ProfileScreen()),
//             ).then((_) {
//               if (mounted) setState(() => _selectedIndex = 0);
//             });
//           }
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.calendar_month),
//             label: 'Appointments',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite_border),
//             label: 'Saved',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person_outline),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/doctor.dart';
import '../services/doctor_service.dart';
import '../widgets/category_item.dart';
import '../widgets/doctor_card.dart';
import 'appointments_screen.dart';
import 'doctor_details_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  final DoctorService _doctorService = DoctorService();

  String _searchQuery = '';
  bool _isUploading = false;
  int _selectedIndex = 0;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _uploadDoctors() async {
    setState(() => _isUploading = true);

    try {
      await _doctorService.addDoctorsToFirestore();

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Doctors synced to Firebase successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sync failed: $e'), backgroundColor: Colors.red),
      );
    } finally {
      if (mounted) {
        setState(() => _isUploading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF7655D9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F7FC),
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, Welcome 👋',
              style: TextStyle(fontSize: 13, color: Colors.grey),
            ),
            SizedBox(height: 3),
            Text(
              'Find Your Doctor',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFEAE3FF),
              child: Icon(Icons.person, color: primaryColor, size: 24),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),

            // Search Bar
            TextField(
              controller: _searchController,
              onChanged: (val) {
                setState(() {
                  _searchQuery = val.trim().toLowerCase();
                });
              },
              decoration: InputDecoration(
                hintText: 'Search doctors...',
                prefixIcon: const Icon(Icons.search, color: primaryColor),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                          setState(() => _searchQuery = '');
                        },
                      )
                    : null,
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Your Health Matters!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Book appointments with the best doctors.',
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      if (doctors.isNotEmpty) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) =>
                                DoctorDetailsScreen(doctor: doctors.first),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                    ),
                    child: const Text(
                      'Book Appointment',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Specialities
            const Text(
              'Specialities',
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CategoryItem(icon: Icons.favorite, name: 'Cardiology'),
                  CategoryItem(icon: Icons.face, name: 'Dentist'),
                  CategoryItem(icon: Icons.remove_red_eye, name: 'Eye Care'),
                  CategoryItem(icon: Icons.child_care, name: 'Pediatric'),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // Top Doctors Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Top Doctors',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                TextButton.icon(
                  onPressed: _isUploading ? null : _uploadDoctors,
                  icon: _isUploading
                      ? const SizedBox(
                          width: 14,
                          height: 14,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.cloud_upload, size: 16),
                  label: Text(
                    _isUploading ? 'Syncing...' : 'Sync Firebase',
                    style: const TextStyle(color: primaryColor, fontSize: 13),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Doctors List with Images
            StreamBuilder<List<Doctor>>(
              stream: _doctorService.getDoctorsStream(),
              builder: (context, snapshot) {
                final list = snapshot.data ?? doctors;

                final filteredDoctors = list.where((doctor) {
                  if (_searchQuery.isEmpty) return true;

                  return doctor.name.toLowerCase().contains(_searchQuery) ||
                      doctor.speciality.toLowerCase().contains(_searchQuery);
                }).toList();

                if (filteredDoctors.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 30),
                    child: Center(
                      child: Text(
                        'No doctors found',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: filteredDoctors.length,
                  itemBuilder: (context, index) {
                    final doctor = filteredDoctors[index];

                    return DoctorCard(
                      doctor: doctor,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => DoctorDetailsScreen(doctor: doctor),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      // Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() => _selectedIndex = index);

          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AppointmentsScreen()),
            ).then((_) {
              if (mounted) {
                setState(() => _selectedIndex = 0);
              }
            });
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ProfileScreen()),
            ).then((_) {
              if (mounted) {
                setState(() => _selectedIndex = 0);
              }
            });
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
