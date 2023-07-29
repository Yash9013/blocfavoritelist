import 'package:blocproject/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/userbloc/user_bloc.dart';
import 'bloc/userbloc/user_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc()..add(FetchUserDataEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          snackBarTheme: SnackBarThemeData(
            backgroundColor: Colors.deepPurpleAccent,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.deepPurpleAccent,
              iconTheme: IconThemeData(
                color: Colors.white,
              )),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
