import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationsManager {
  PushNotificationsManager._();

  factory PushNotificationsManager() => _instance;

  static final PushNotificationsManager _instance = PushNotificationsManager._();

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure(
        
        onMessage: (Map<String, dynamic> message) async {
          debugPrint("onMessage: $message");
          //_showItemDialog(message);
        },
        onBackgroundMessage: (Map<String, dynamic> message) async {
          debugPrint("onBackgroundMessage: $message");
          //_navigateToItemDetail(message);
        },
        onLaunch: (Map<String, dynamic> message) async {
          debugPrint("onLaunch: $message");
          //_navigateToItemDetail(message);
        },
        onResume: (Map<String, dynamic> message) async {
          debugPrint("onResume: $message");
         // _navigateToItemDetail(message);
        },
      );

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");

      _initialized = true;
    }
  }
}
