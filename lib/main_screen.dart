import 'dart:io';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homben_ai/AppResultModel.dart';
import 'package:image_picker/image_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int count = 0;
  XFile? xFile;

  void shootImage() async {
    final imagePicker = ImagePicker();
    xFile = await imagePicker.pickImage(
      source: ImageSource.camera,
    );

    if (xFile != null) {
      count++;
      Appresultmodel model = Appresultmodel.getData(count);
      await Navigator.of(context).push(CupertinoDialogRoute(
          builder: (context) => HombenCard(xFile: xFile!, model: model),
          context: context));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 53, 35, 33),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                image: DecorationImage(image: AssetImage('assets/logo.jpg'))),
          ),
          Center(
            child: Container(
                width: 200,
                child: Text(
                  "Homben AI \n vidura's Edition",
                  style: GoogleFonts.gemunuLibre(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                )),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child: Container(
              width: 300,
              child: Text(
                "හරකාගේ අයිතිකාරයා සොයා ගැනීමට හරකාගෙ හොම්බ ස්කෑන් කරන්න !",
                style:
                    GoogleFonts.gemunuLibre(color: Colors.white, fontSize: 25),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          FilledButton(onPressed: shootImage, child: Text("Scan"))
        ],
      ),
    );
  }
}

class HombenCard extends StatefulWidget {
  final XFile xFile;
  final Appresultmodel model;

  const HombenCard({super.key, required this.xFile, required this.model});

  @override
  State<HombenCard> createState() => _HombenCardState();
}

class _HombenCardState extends State<HombenCard> {
  bool isLoading = true;
  String loadingText = "Loading...";

  void loadingAnimation()async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      loadingText = "හරකගෙ හොම්බ is Annalizing...";
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      loadingText = "කොල්ලන්ට බොරු කතා කියන්න එපා හුත්තොහ්...";
    });
    await Future.delayed(Duration(seconds:2));
    setState(() {
      loadingText = "හම්බුනා....";
      isLoading = false;
    });
  }
  @override
  void initState() {
    loadingAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: BlurryContainer(
          height: 500,
          width: 500,
          blur: 20,
          color: const Color.fromARGB(240, 53, 35, 33),
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "හරකාගේ අයිතිකරු සෙවීම",
                style:
                    GoogleFonts.gemunuLibre(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ),

              isLoading? Container(
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    CircularProgressIndicator(color: Colors.white,strokeWidth: 5,),
                    SizedBox(height: 10,),
                    Text(
                      loadingText,
                      style:
                      GoogleFonts.gemunuLibre(color: Colors.white, fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ):SizedBox(),
              // !isLoading ? Center(
              //   child: SizedBox(
              //     width: 400,
              //     height: 200,
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Container(
              //             width: double.infinity,
              //             height: double.infinity,
              //             child: Image.file(File(widget.xFile.path),),
              //           ),
              //         ),
              //         Expanded(
              //           child: Container(
              //             width: double.infinity,
              //             height: double.infinity,
              //             child: Image.network(widget.model.image,)
              //           ),
              //          ),
              //       ],
              //     ),
              //   ),
              // ):SizedBox()
              SizedBox(height: 50,),
              !isLoading ? Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  image:DecorationImage(
                    image: AssetImage(widget.model.image)
                  )
                ),
              ):SizedBox(),
              SizedBox(height: 50,),
              !isLoading ? Text(
                "හරකාගේ අයිතිකරු : ${widget.model.name}",
                style:
                GoogleFonts.gemunuLibre(color: Colors.white, fontSize: 30),
                textAlign: TextAlign.center,
              ):SizedBox(),

              FilledButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text("OK"))
            ],
          ),
        ),
      ),
    );
  }
}
