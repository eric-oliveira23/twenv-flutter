import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twenv/pages/add_value_page/add_value_cubit.dart';
import 'package:twenv/pages/splash_page.dart';
import 'package:twenv/theme/theme.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddValueCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        home: const SplashPage(),
      ),
    );
  }
}
