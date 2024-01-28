import 'package:chat_appication/pages/auth/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'firebase_options.dart';

late Size mq;
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((value){
      _initialiseFirebase();
      runApp(const ChatApp());
  });
}
class ChatApp extends StatelessWidget {
  const ChatApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'chat',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurpleAccent,
          centerTitle: true,
          elevation: 10,
          titleTextStyle: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 25,
          ),
         // primarySwatch: Colors.lightBlue
        ),
      ),
      // home: home_screen(),
      home: LoginPage(),
    );
  }
}


_initialiseFirebase() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}