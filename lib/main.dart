import 'package:flutter/material.dart';
import 'package:khalti_example/home_page.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KhaltiScope(
      publicKey: 'test_public_key_d5d9f63743584dc38753056b0cc737d5',
      builder: (context, navigatorKey) {
        return MaterialApp(
          navigatorKey: navigatorKey,
          supportedLocales: const [Locale('en', 'US')],
          localizationsDelegates: const [KhaltiLocalizations.delegate],
          title: 'Khalti Integration',
          theme: ThemeData(
            primarySwatch: Colors.purple, // Khalti's brand color
          ),
          home: const HomePage(),
        );
      },
    );
  }
}
