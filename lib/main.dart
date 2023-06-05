import 'package:flutter/material.dart';
import 'package:galapagos_trip_app/config/theme/app_theme.dart';
import 'package:galapagos_trip_app/presentation/providers/home_provider.dart';
import 'package:galapagos_trip_app/presentation/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // Se crea provider a nivel global de la aplicación
      providers: [ChangeNotifierProvider(create: (_) => HomeProvider())],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const HomeScreen(),
      ),
    );
  }
}
