import 'package:doanflutterfahasa/pages/main_layout_private.dart';
import 'package:doanflutterfahasa/pages/main_layout_public.dart';
import 'package:doanflutterfahasa/providers/NavigatorProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_)=>NavigationProvider())
        ],
        child: const MyApp()
      )
      );
      
      

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context,snapshot){

          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if(snapshot.hasData){
            return const MainLayoutPrivate();
          }
          return const MainLayoutPublic();

        }



      )
    );
  }
}
