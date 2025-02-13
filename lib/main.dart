import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:government_service_app/providers/connection_provider.dart';
import 'package:government_service_app/providers/bookmark_provider.dart'; // Import BookmarkProvider
import 'package:government_service_app/screens/detail_page.dart';
import 'package:government_service_app/screens/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Internetprovider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        ),
        initialRoute: 'landing_page',
        routes: {
          'landing_page': (context) => LandingPage(),
          'detail_page': (context) => DetailPage(),
        },
      ),
    );
  }
}
