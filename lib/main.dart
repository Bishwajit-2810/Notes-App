import 'package:flutter/material.dart';
import 'package:notes_app/pages/exit_page.dart';
import 'package:notes_app/models/note_database.dart';
import 'package:notes_app/provider/theme_controller.dart';
import 'package:notes_app/pages/theme_page.dart';
import 'package:provider/provider.dart';
import 'pages/note_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ThemeController(),
          ),
          ChangeNotifierProvider(
            create: (context) => NoteDatabase(),
          ),
        ],
        builder: (context, child) {
          final provider = Provider.of<ThemeController>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: provider.getTheme(),
            routes: {
              "/note_page": (context) => const NotePage(),
              "/theme_page": (context) => const ThemePage(),
              "/exit_page": (context) => const ExitPage(),
            },
            home: const NotePage(),
          );
        });
  }
}
