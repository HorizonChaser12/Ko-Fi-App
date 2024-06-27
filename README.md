# Ko-Fi_App

A Flutter application for managing a coffee shop.

## Overview

The Ko-Fi App is a mobile application built using Flutter to help users browse and purchase coffee. The app includes features such as viewing different types of coffee, adding items to a cart, and completing purchases.

Here's the updated section for the README file based on recent changes made to the Ko-Fi App:

---

## Updates

### June 2024

- **Added Coffee Selection and Cart Functionality:**
  - Implemented `CoffeeWithSize` class to handle different coffee sizes.
  - Added a selection page (`SelectionPage`) for choosing coffee size and quantity.
  - Updated `CartPage` to display selected coffee items with size and quantity.
  - Added `addItemToCart` and `removeItemFromCart` methods in `CoffeeShop` model.

- **UI Improvements:**
  - Enhanced `CoffeeTile` component for better visual representation.
  - Implemented Lottie animations for a dynamic user experience.
  - Improved cart UI to display an empty cart message when no items are present.

- **Bug Fixes:**
  - Corrected pricing display issue by ensuring proper formatting in `CoffeeTile`.
  - Fixed context-related bugs in cart operations.

---

For more details, visit the [Ko-Fi App repository](https://github.com/HorizonChaser12/Ko-Fi-App).

## Features

- Browse a variety of coffee options from selection page
- Add coffee to the cart with specified sizes and quantities
- Remove items from the cart
- unusable payment page

## Getting Started

### Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.

### Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/HorizonChaser12/Ko-Fi-App.git
    cd Ko-Fi-App
    ```

2. Install dependencies:
    ```sh
    flutter pub get
    ```

3. Run the application:
    ```sh
    flutter run
    ```

## Project Structure

- `lib`: Contains the main source code for the application.
  - `components`: Custom widgets used in the app.
  - `models`: Data models for coffee and coffee shop.
  - `pages`: Different pages/screens of the app.
- `assets`: Contains images and other static assets.

## Dependencies

- `provider`: State management solution for Flutter.
- `lottie`: Library for adding animations.

## Contribution

Feel free to fork this repository and submit pull requests. For major changes, please open an issue first to discuss what you would like to change.
