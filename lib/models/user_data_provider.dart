import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserDataProvider with ChangeNotifier {
  Map<String, dynamic>? _userData; // In-memory data
  final SharedPreferences _prefs; // Shared preferences instance

  UserDataProvider(this._prefs);

  Map<String, dynamic>? get userData => _userData;

  // Load user data from shared preferences
  Future<void> loadUserData() async {
    final userDataString = _prefs.getString('user_data');
    if (userDataString != null) {
      _userData = Map<String, dynamic>.from(json.decode(userDataString));
      notifyListeners();
    }
  }

  // Set user data and store it in shared preferences
  void setUserData(Map<String, dynamic> userData) {
    _userData = userData;
    notifyListeners();

    _prefs.setString('user_data', json.encode(userData));
  }

  void clearUserData() {
    _userData = null;
    notifyListeners();
  }
}
