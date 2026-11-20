# MediBook – Doctor Appointment Booking App

## About the Project

MediBook is a mobile application developed using Flutter and Dart. It helps users find doctors, explore their profiles, and manage doctor appointments easily.

The application provides a simple and user-friendly interface where users can search for doctors, browse specialities, view doctor details, and manage their personal information.

Firebase Authentication is used for user login and registration, while Cloud Firestore is used to store and retrieve doctor, appointment, and user information.

## Features

### User Authentication
- User Registration
- User Login
- Firebase Authentication
- Secure Logout

### Home Screen
- View available doctors
- Search doctors by name
- Search doctors by speciality
- Browse doctor categories
- View top doctors

### Doctor Information
- View doctor profiles
- View doctor speciality
- View doctor experience
- View doctor ratings
- View detailed doctor information

### Appointment Management
- Book doctor appointments
- Select appointment date and time
- View booked appointments
- Edit appointment details
- Delete appointments
- View appointment history

### User Profile
- View personal information
- Edit full name
- Update phone number
- Update date of birth
- Update gender
- View appointment details

### Settings
- Change password through email reset link
- View account security information
- View MediBook app information

## Technologies Used

- Flutter
- Dart
- Firebase Authentication
- Cloud Firestore
- Material Design
- Android Studio
- VS Code

## Project Structure

```text
lib/
│
├── models/
│   ├── doctor.dart
│   └── appointment.dart
│
├── screens/
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── profile_screen.dart
│   ├── appointments_screen.dart
│   └── doctor_details_screen.dart
│
├── services/
│   └── doctor_service.dart
│
├── widgets/
│   ├── category_item.dart
│   └── doctor_card.dart
│
├── firebase_options.dart
└── main.dart
```

## Firebase Integration

MediBook uses Firebase services:

- **Firebase Authentication:** Handles user registration and login.
- **Cloud Firestore:** Stores and retrieves doctor information, appointments, and user profile details.

## Installation and Setup

### 1. Clone the Repository

```bash
git clone YOUR_GITHUB_REPOSITORY_URL
```

### 2. Open the Project Folder

```bash
cd medibook
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Configure Firebase

Configure your own Firebase project using FlutterFire CLI and generate the required `firebase_options.dart` file.

Enable:
- Firebase Authentication
- Cloud Firestore

### 5. Run the Application

```bash
flutter run
```

## Screenshots

Add screenshots of the following screens:

- Login Screen
- Signup Screen
- Home Screen
- Doctor Details Screen
- Appointment Screen
- Profile Screen
- Settings Screen

## Future Improvements

- Push Notifications for appointment reminders
- Online Payment Integration
- Doctor Reviews and Feedback
- More advanced appointment management
- Improved doctor search and filtering

## Developer

**Vijayasree M**

Flutter Developer

## Conclusion

MediBook is a Flutter-based doctor appointment booking application developed to practice mobile application development, Firebase integration, authentication, database management, and UI design.

**Built with Flutter and Firebase.**