import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty_flutter_app/data/services/episodes_service.dart';
import 'package:rick_and_morty_flutter_app/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Provider<EpisodeService>(
        create: (BuildContext context) => EpisodeService.create(),
        dispose: (_, EpisodeService repository) => repository.client.dispose(),
        child: const HomeScreen(),
      ),
    );
  }
}
