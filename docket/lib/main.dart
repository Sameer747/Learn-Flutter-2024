import 'package:docket/models/save_task.dart';
import 'package:docket/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
      create: (context) => SaveTask(), child: const Docket()));
}

class Docket extends StatelessWidget {
  const Docket({super.key});
  @override
  Widget build(BuildContext context) {
    final router = goRouter();
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, useMaterial3: true),
      title: 'Docket',
    );
  }
}
