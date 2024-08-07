import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals/screen/tabs.dart';
final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: Colors.blueGrey, // Maintains a teal accent
  ),
  textTheme: GoogleFonts.latoTextTheme(),
  scaffoldBackgroundColor: const Color.fromARGB(18, 0, 0, 0), // Sets background to black
);

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabScreen(),
    );
    
  }
}