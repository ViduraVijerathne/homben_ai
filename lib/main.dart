import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homben_ai/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void navigate()async{
    await Future.delayed(Duration(seconds: 10));
    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()));
  }
  @override
  void initState() {
    if(mounted){
      navigate();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 35, 33),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/logo.jpg'),
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: 650,),
            Text("Homben AI ",style: GoogleFonts.abhayaLibre(fontWeight: FontWeight.w900,fontSize: 52,color: Colors.white),),
            CircularProgressIndicator(color: Colors.white),
            SizedBox(height: 10,),
            Text("Developed By Vidura Vijerathne",style: GoogleFonts.abhayaLibre(color: Colors.white))
          ],
        ),
      ),
    );
  }
}
