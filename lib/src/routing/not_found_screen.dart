import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:petsave/src/routing/app_router.dart';

/// Simple not found screen used for 404 errors (page not found on web)
class NotFoundScreen extends StatelessWidget {
  /// Creates a new not found screen
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '404 - Page not found!',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                onPressed: () => context.goNamed(AppRoute.welcome.name),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

      // body: const EmptyPlaceholderWidget(
      //   message: '404 - Page not found!',
      // ),