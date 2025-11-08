# Health Monitoring System - Blueprint

## Overview

This document outlines the architecture and implementation plan for the Health Monitoring System, a Flutter application designed for both web and mobile platforms. The system will provide separate interfaces for Admins and Doctors, with a set of common screens for shared functionalities.

## Project Structure

The project will follow a feature-first structure to ensure scalability and maintainability.

```
lib/
|-- src/
|   |-- core/
|   |   |-- app_theme.dart
|   |   |-- router.dart
|   |-- data/
|   |   |-- models/
|   |   |   |-- user_model.dart
|   |   |   |-- notification_model.dart
|   |   |-- mock_data.dart
|   |-- domain/
|   |   |-- models/
|   |   |   |-- doctor_model.dart
|   |   |   |-- patient_model.dart
|   |   |   |-- assignment_model.dart
|   |-- presentation/
|   |   |--screens/
|   |   |  |-- splash_screen.dart
|   |   |  |-- login_screen.dart
|   |   |  |-- role_selection_screen.dart
|   |   |  |-- profile_screen.dart
|   |   |  |-- notifications_screen.dart
|   |   |  |-- help_support_screen.dart
|   |   |  |-- admin_dashboard_screen.dart
|   |   |  |-- manage_doctors_screen.dart
|   |   |  |-- manage_patients_screen.dart
|   |   |  |-- assign_doctor_patient_screen.dart
|   |   |  |-- system_configuration_screen.dart
|   |   |  |-- reports_analytics_screen.dart
|   |   |  |-- admin_settings_screen.dart
|   |   |-- widgets/
|   |   |   |-- common_scaffold.dart
|   |-- main.dart
```

## Features

### Module 1: Common Screens

#### 1. Splash Screen
- **Purpose:** Initial loading screen with branding.
- **Functionality:**
    - Display app logo.
    - Check for existing user sessions.
    - Redirect to either the Dashboard or Login screen.

#### 2. Login Screen
- **Purpose:** Secure user authentication.
- **Functionality:**
    - Email and password input fields.
    - Form validation.
    - API call to authenticate the user (mocked).
    - Role-based redirection.

#### 3. Role Selection Screen
- **Purpose:** Allow users to select their role (Admin or Doctor) after login.
- **Functionality:**
    - Buttons for role selection.
    - Navigates to the corresponding dashboard.

#### 4. Profile Screen
- **Purpose:** View and edit user profiles.
- **Functionality:**
    - Display user information.
    - Allow editing of profile details.
    - "Update" button to save changes.

#### 5. Notifications Center
- **Purpose:** Display a list of notifications.
- **Functionality:**
    - List of notifications with titles, messages, and timestamps.
    - Mark notifications as read.
    - Delete notifications.

#### 6. Help & Support Screen
- **Purpose:** Provide user assistance.
- **Functionality:**
    - FAQ section.
    - Contact information.
    - Feedback form.

### Module 2: Admin Screens

#### 1. Admin Dashboard
- **Purpose:** Provide the Admin with an overview of system activity.
- **Functionality:**
    - Show total number of doctors, patients, and active alerts.
    - Display recent actions.
    - Quick buttons to navigate to key modules.

#### 2. Manage Doctors
- **Purpose:** Create, view, edit, and delete doctor accounts.
- **Functionality:**
    - Display doctor list with search & filter.
    - Add, edit, and delete doctor records.

#### 3. Manage Patients
- **Purpose:** Manage patient data.
- **Functionality:**
    - View, add, edit, and delete patient records.

#### 4. Assign Doctor to Patient
- **Purpose:** Link doctors to their respective patients.
- **Functionality:**
    - View existing doctor–patient mappings.
    - Assign a new doctor to a patient.
    - Remove existing assignments.

#### 5. System Configuration
- **Purpose:** Customize system parameters for health data tracking.
- **Functionality:**
    - Define which health metrics are active.
    - Set normal ranges for alerts.

#### 6. Reports & Analytics
- **Purpose:** View performance insights and system usage data.
- **Functionality:**
    - Show charts for key metrics.
    - Export reports.

#### 7. Admin Settings
- **Purpose:** Manage admin’s account and app preferences.
- **Functionality:**
    - Update personal info.
    - Manage notification preferences.
    - Toggle dark/light mode.
    - Logout.

### Module 3: Doctor Screens

#### 1. Doctor Dashboard
- **Purpose:** Overview of doctor’s patients, alerts, and stats.
- **Functionality:**
    - Display total assigned patients.
    - Show number of active alerts.
    - View recent patient updates.
    - Quick navigation to patient list and alerts.

#### 2. Assigned Patients
- **Purpose:** List of all patients under the doctor.
- **Functionality:**
    - Fetch and display assigned patients.
    - Search/filter by name, condition, or alert status.
    - Tap on a patient to open their profile.

#### 3. Patient Profile
- **Purpose:** Detailed patient information and history.
- **Functionality:**
    - View basic details (name, age, gender, condition, contact info).
    - Show assigned date and recent readings summary.
    - Navigate to Health Data (Vitals) and Doctor Notes.

#### 4. Patient Health Data
- **Purpose:** Vitals tracking and graphical visualization.
- **Functionality:**
    - Fetch all recorded vitals.
    - Display data as both list and charts.
    - Highlight abnormal readings.
    - Export patient health data as a PDF report.

#### 5. Add Doctor Notes
- **Purpose:** Add or update doctor’s notes and recommendations.
- **Functionality:**
    - Add or edit medical notes for a patient.
    - Attach documents (optional).
    - Save note via API.
    - Display all previous notes.

#### 6. Alerts & Notifications
- **Purpose:** Alerts for abnormal readings or system events.
- **Functionality:**
    - View list of active alerts.
    - Mark alert as read or resolved.
    - Navigate to affected patient’s profile.
    - Receive push notifications for new alerts.

#### 7. Doctor Settings
- **Purpose:** Manage personal info, preferences, and logout.
- **Functionality:**
    - Update personal info (name, contact, specialization).
    - Change password.
    - Toggle notification preferences.
    - Enable/disable dark mode.
    - Logout.

## State Management

- **Provider:** Used for managing app-wide state, such as the current theme and authenticated user.

## Navigation

- **go_router:** Used for declarative routing, enabling deep linking and complex navigation flows.

## Plan

1.  **Create `blueprint.md`:** Done.
2.  **Create Folder Structure:** Done.
3.  **Add Dependencies:** Done.
4.  **Implement `main.dart`:** Done.
5.  **Create Data Models:** Done.
6.  **Implement Screens:** In progress.
7.  **Implement Navigation:** In progress.
8.  **Use Mock Data:** Populate the UI with mock data where necessary.
