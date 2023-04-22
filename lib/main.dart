import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:petsave/src/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:user_repository/user_repository.dart';

void main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      final sharedPreferences = await SharedPreferences.getInstance();

      runApp(
        ProviderScope(
          overrides: [
            // override the previous value with the new object
            sharedPreferencesServiceProvider
                .overrideWithValue(sharedPreferences),
          ],
          child: const MyApp(),
        ),
      );

      // * This code will present some error UI if any uncaught exception happens
      FlutterError.onError = (FlutterErrorDetails details) {
        FlutterError.presentError(details);
      };
      ErrorWidget.builder = (FlutterErrorDetails details) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: const Text('An error occurred'),
          ),
          body: Center(child: Text(details.toString())),
        );
      };
    },
    (Object error, StackTrace stack) {
      // * Log any errors to console
      debugPrint(error.toString());
    },
  );
}
