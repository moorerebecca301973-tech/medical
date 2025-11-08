# Project Blueprint

## Overview

This project is a Flutter application designed for managing patients and doctors in a healthcare setting. The application provides a comprehensive set of features for different user roles, including doctors and administrators. It includes functionalities such as patient management, doctor assignments, reporting, and user authentication.

## Style and Design

The application follows a modern and professional design language, with a focus on usability and clarity. The theme is defined in `lib/src/core/theme.dart` and includes a custom color scheme, typography, and component styles.

- **Colors**: The primary color is a shade of blue, with a light and clean background. The color scheme is designed to be accessible and visually appealing.
- **Typography**: The app uses the `google_fonts` package to provide a consistent and modern typography. The primary fonts are Poppins and Lato.
- **Components**: The UI components are styled to match the overall design, with custom themes for buttons, cards, and input fields.

## Features

### User Authentication

- **Login**: Users can log in to the application using their email and password. The login screen is the initial screen of the app.
- **Roles**: The application supports different user roles, such as `doctor` and `admin`.

### Doctor Features

- **Dashboard**: Doctors can view their assigned patients and other relevant information on their dashboard.
- **Profile**: Doctors can view and edit their profile information.
- **Assigned Patients**: Doctors can see a list of patients assigned to them.

### Admin Features

- **Manage Patients**: Admins can add, edit, and view all patients in the system.
- **Manage Doctors**: Admins can add, edit, and view all doctors.
- **Assign Doctors**: Admins can assign doctors to patients.
- **Reports and Analytics**: Admins can view reports and analytics on patient data.

### General Features

- **Help and Support**: A dedicated screen provides help and support information to users.
- **Navigation**: The application uses the `go_router` package for declarative navigation, making it easy to navigate between screens.

## Project Structure

The project is organized into the following directories:

- **`lib/src/core`**: Contains the core logic of the application, including routing and theming.
- **`lib/src/data`**: Contains the data layer of the application, including mock data for testing.
- **`lib/src/domain`**: Contains the domain models of the application, such as `Patient` and `Doctor`.
- **`lib/src/presentation`**: Contains the presentation layer of the application, including screens and widgets.
