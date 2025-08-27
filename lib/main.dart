import 'package:flutter/material.dart';
import 'package:store_service_app/src/core/config/env_config.dart';
import 'package:store_service_app/src/core/di/injector.dart';
import 'package:store_service_app/src/features/item/presentation/pages/item_list_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EnvConfig.load();
  await initDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: ItemListPageWrapper());
  }
}
