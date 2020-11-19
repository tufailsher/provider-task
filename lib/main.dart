import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_task/blocs/countries_bloc.dart';
import 'package:provider_task/pages/home_page.dart';
import 'package:provider_task/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => CountriesBLOC()),
        ],
        child: MaterialApp(
          theme: AppTheme.data(),
          home: HomePage(),
        ),
      );
}
