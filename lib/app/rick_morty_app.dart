import 'package:flutter/material.dart';

import 'app_router.dart';

class RickMortyApp extends StatelessWidget {
  const RickMortyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
      debugShowCheckedModeBanner: false, routerConfig: AppRouter().config());
}
