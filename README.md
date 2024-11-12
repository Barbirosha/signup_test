# Clario Test Project

## Overview

This project is a Flutter application

## Project Structure

The project is organized into the following main directories:

- `lib`: Contains the main source code for the Flutter application.
  - `components`: Contains reusable UI components.
  - `resources`: Contains resource files such as colors, strings, and images.
  - `screens`: Contains the different screens of the application.
  - `utils`: Contains utility functions and classes.

## Custom Text Form Field

The `CustomTextField` component is a reusable text field widget that supports validation, custom styling, and more. It is located in the `lib/components/custom_text_form_field.dart` file.

### Why Bloc Was Not Used

Bloc (Business Logic Component) was not used in this project to keep the example simple. However, for larger and more complex applications, using Bloc or another state management solution is recommended to manage the application's state more effectively.

## Localization

The project currently does not include localization. However, localization can be improved by using the `flutter_localizations` package and organizing the localized strings in a structured manner. This will allow the application to support multiple languages and provide a better user experience for a global audience.

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/clario_test.git