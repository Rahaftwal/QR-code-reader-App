// QR Code Reader
// Developed by Rahaf Altwal
// GitHub: https://github.com/Rahaftwal
// Email: rahaftwal@gmail.com

import 'package:shared_preferences/shared_preferences.dart';

class QRScanService {
  static const String _storageKey = 'qr_scan_history';
  
  Future<void> saveScannedCode(String code) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> existingCodes = await getScannedCodes();
    
    if (!existingCodes.contains(code)) {
      existingCodes.insert(0, code);
      await prefs.setStringList(_storageKey, existingCodes);
    }
  }

  Future<List<String>> getScannedCodes() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_storageKey) ?? [];
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }
} 