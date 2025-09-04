
import 'package:flutter/material.dart';
import 'package:netflix_api/controller/bottom_nav_provider.dart';
import 'package:netflix_api/controller/netflix_provider.dart';
import 'package:netflix_api/view/splash%20page/splash.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true, 
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NetFlixProviderrr()),
        ChangeNotifierProvider(create: (_) => BottomNavProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        useInheritedMediaQuery: true, // 👈 important for device_preview
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white),
            bodySmall: TextStyle(color: Colors.white),
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
