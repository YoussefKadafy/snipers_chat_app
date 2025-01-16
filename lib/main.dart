import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snipers/cubits/chat_cubit/chat_cubit.dart';
import 'package:snipers/cubits/login_cubit/login_cubit.dart';
import 'package:snipers/cubits/register_cubit/register_cubit.dart';
import 'package:snipers/firebase_options.dart';
import 'package:snipers/screens/chat_screen.dart';
import 'package:snipers/screens/log_in.dart';
import 'package:snipers/screens/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<RegisterCubit>(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LogIn.id: (context) => LogIn(),
          RegisterScreen.id: (context) => RegisterScreen(),
          ChatScreen.id: (context) => ChatScreen(),
        },
        initialRoute: LogIn.id,
      ),
    );
  }
}
