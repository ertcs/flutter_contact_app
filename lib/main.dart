import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';
import 'package:fluttercontactapp/Pages/signinpage/singinpagewidget.dart';
import 'package:fluttercontactapp/Pages/signuppage/signupwidget.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: Colors.white));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          textTheme: TextTheme(
            headline1: GoogleFonts.raleway(fontSize: 65, color: Colors.black, letterSpacing: 2.0),
            /*displayTextStyle*/

            subtitle2: GoogleFonts.rajdhani(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w500),
            /*titleTextStyle*/

            subtitle1: GoogleFonts.openSansCondensed(fontSize: 18, color: Colors.black),
            /*subTitleTextStyle*/

            bodyText1: GoogleFonts.montserrat(fontSize: 16, color: Colors.black),
            /*montserrat*/
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 150,
          ),
          SizedBox(
            height: 210,
            child: Center(
                child: Image.asset(
              'assets/images/icons_images/logo_demo.jpg',
              height: 200,
              width: 200,
            )),
          ),
          Center(
            child: Text(
              'CONNECTION',
              style: TextStyle(
                fontSize: 36,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 150,
          ),
          Hero(
            tag: 'Sign in',
            child: LogInBtn(
              title: 'Sign in'.toUpperCase(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignInPageWidget()),
                );
              },
              boxColor: Colors.indigoAccent,
            ),
          ),
          Hero(
            tag: 'Sign up',
            child: LogInBtn(
              title: 'Sign up'.toUpperCase(),
              function: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signupwidget()),
                );
              },
              boxColor: Colors.deepPurpleAccent,
            ),
          ),
        ],
      ),
    );
  }
}

