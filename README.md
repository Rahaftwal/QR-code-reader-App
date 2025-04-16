# QR Code Reader

A Flutter application for scanning QR codes and maintaining a history of scanned codes.

## Developer
- **Name**: Rahaf Altwal
- **GitHub**: https://github.com/Rahaftwal
- **Email**: rahaftwal@gmail.com

## Features

- 📱 Real-time QR code scanning using device camera
- 💡 Flash control for better scanning in low light
- 🔄 Front/Back camera switching
- 📋 Scan history storage
- 📝 View scan details
- 📋 Copy scanned codes to clipboard
- 🎨 Modern Material Design UI
- 🌐 English interface

## Project Structure

```
lib/
├── main.dart                 # Application entry point
├── screens/
│   └── home_screen.dart      # Main screen with navigation
├── widgets/
│   ├── qr_scanner_widget.dart    # QR code scanning functionality
│   └── scan_history_widget.dart  # History display
└── services/
    └── qr_scan_service.dart      # Data management service
```

## Getting Started

### Prerequisites

- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 3.0.0 or higher)
- Android Studio / VS Code with Flutter extensions

### Installation

1. Clone the repository:
```bash
git clone [repository-url]
cd qr_code_reader
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run
```

## Dependencies

- `mobile_scanner: ^3.5.5` - For QR code scanning functionality
- `shared_preferences: ^2.2.2` - For local storage of scan history
- `cupertino_icons: ^1.0.2` - For iOS-style icons

## Usage

1. **Scanning QR Codes**
   - Open the app and tap the "Scan" tab
   - Point your camera at a QR code
   - The app will automatically detect and display the QR code content
   - Use the flash button for better scanning in low light
   - Switch between front and back cameras as needed

2. **Viewing Scan History**
   - Tap the "History" tab to view all previously scanned codes
   - Tap any item to view its details
   - Use the copy button to copy the code content to clipboard

## Technical Details

### QR Scanner Widget
- Uses `MobileScanner` for real-time QR code detection
- Implements flash control and camera switching
- Shows results in a dialog with copy option

### Scan History Widget
- Displays list of previously scanned codes
- Uses `SharedPreferences` for persistent storage
- Implements infinite scroll for large history

### QR Scan Service
- Manages storage and retrieval of scanned codes
- Implements duplicate prevention
- Provides methods for clearing history

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email [your-email@example.com] or open an issue in the repository.

## Acknowledgments

- Flutter team for the amazing framework
- Mobile Scanner package developers
- All contributors to this project
