import 'package:flutter/material.dart';
import 'package:task_assessment/loginScreen.dart';
import 'package:task_assessment/registrationScreen.dart';
import 'package:task_assessment/utility.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String? token= await ReadUserData('token');
  if(token==null){
    runApp( MyApp("/login"));
  }
  else{
    runApp( MyApp("/"));
  }
}

class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Assessment",
      initialRoute: FirstRoute,
      routes: {
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
      },
    );
  }
}