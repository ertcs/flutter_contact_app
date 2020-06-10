import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadingWidget extends StatelessWidget {
  final String title;

  HeadingWidget({@required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(title, style: TextStyle(fontSize: 55, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}

class LogInBtn extends StatelessWidget {
  final String title;
  final Color boxColor;
  final Function function;

  LogInBtn({@required this.title, @required this.boxColor, @required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Text(
            title,
            style: GoogleFonts.openSansCondensed(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          )),
        ),
      ),
    );
  }
}

class IconSignUpBtn extends StatelessWidget {
  final String title;
  final Color boxColor;
  final Function function;
  final Icon iconData;

  IconSignUpBtn({@required this.title, @required this.boxColor, @required this.function, this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: boxColor,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              iconData,
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: GoogleFonts.openSansCondensed(fontSize: 25, color: Colors.white, fontWeight: FontWeight.w500),
              ),
            ],
          )),
        ),
      ),
    );
  }
}

class TabText extends StatelessWidget {
  final String title;
  final Color color;

  TabText(this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.w700, color: color, fontSize: 18.0, letterSpacing: 2.0),
    );
  }
}

Widget socialIcon(IconEnum iconEnum, double size) {
  String filepath;
  switch (iconEnum) {
    case IconEnum.ADD_CONTACT:
      filepath = 'assets/images/icons_images/icn_add_contact.png';
      break;
    case IconEnum.EMAIL:
      filepath = 'assets/images/icons_images/icon_email.png';
      break;
    case IconEnum.FACEBOOK:
      filepath = 'assets/images/icons_images/icn_facebook.png';
      break;
    case IconEnum.GMAIL:
      filepath = 'assets/images/icons_images/icn_gmail.png';
      break;
    case IconEnum.GOOGLE:
      filepath = 'assets/images/icons_images/icn_google.png';
      break;
    case IconEnum.HANGOUT:
      filepath = 'assets/images/icons_images/icn_hangout.png';
      break;
    case IconEnum.INSTAGRAM:
      filepath = 'assets/images/icons_images/icn_insta.png';
      break;
    case IconEnum.LINEDIN:
      filepath = 'assets/images/icons_images/icn_linkedin.png';
      break;
    case IconEnum.MYSPACE:
      filepath = 'assets/images/icons_images/icn_myspace.png';
      break;
    case IconEnum.OUTLOOK:
      filepath = 'assets/images/icons_images/icn_outlook.png';
      break;
    case IconEnum.PINTEREST:
      filepath = 'assets/images/icons_images/icn_pinterest.png';
      break;
    case IconEnum.QRCODE:
      filepath = 'assets/images/icons_images/icn_qrcode.png';
      break;
    case IconEnum.REDDIT:
      filepath = 'assets/images/icons_images/icn_reddit.png';
      break;
    case IconEnum.SNAPCHAT:
      filepath = 'assets/images/icons_images/icn_snapchat.png';
      break;
    case IconEnum.TELEGRAM:
      filepath = 'assets/images/icons_images/icn_telegram.png';
      break;
    case IconEnum.TICTOK:
      filepath = 'assets/images/icons_images/icn_tictok.png';
      break;
    case IconEnum.TWITTER:
      filepath = 'assets/images/icons_images/icn_twitter.png';
      break;
    case IconEnum.VIBER:
      filepath = 'assets/images/icons_images/icn_viber.png';
      break;
    case IconEnum.WECHAT:
      filepath = 'assets/images/icons_images/icn_wechat.png';
      break;
    case IconEnum.WHATSAPP:
      filepath = 'assets/images/icons_images/icn_whatsapp.png';
      break;
    case IconEnum.YOUTUBE:
      filepath = 'assets/images/icons_images/icn_youtube.png';
      break;
    case IconEnum.SKYPE:
      filepath = 'assets/images/icons_images/isn_skype.png';
      break;
    case IconEnum.SMS:
      filepath = 'assets/images/icons_images/icn_sms.png';
      break;
    case IconEnum.VIDEO_CALL:
      filepath = 'assets/images/icons_images/icn_videocall.png';
      break;
  }
  return SizedBox(
      height: size,
      width: size,
      child: Image.asset(
        filepath,
        fit: BoxFit.fill,
      ));
}

List<Widget> socialList1() {
  return [
    socialIcon(IconEnum.TWITTER, 30),
    socialIcon(IconEnum.EMAIL, 30),
    socialIcon(IconEnum.REDDIT, 30),
    socialIcon(IconEnum.MYSPACE, 30),
    socialIcon(IconEnum.LINEDIN, 30),
  ];
}

List<Widget> socialList2() {
  return [
    socialIcon(IconEnum.GMAIL, 30),
    socialIcon(IconEnum.PINTEREST, 30),
    socialIcon(IconEnum.TICTOK, 30),
    socialIcon(IconEnum.VIBER, 30),
    socialIcon(IconEnum.SNAPCHAT, 30),
  ];
}

List<Widget> socialListTop1() {
  return [
    socialIcon(IconEnum.SMS, 30),
    socialIcon(IconEnum.VIDEO_CALL, 30),
    socialIcon(IconEnum.WHATSAPP, 30),
    socialIcon(IconEnum.SKYPE, 30),
    socialIcon(IconEnum.FACEBOOK, 30),
  ];
}

List<Widget> socialListTop2() {
  return [
    socialIcon(IconEnum.SMS, 30),
    socialIcon(IconEnum.VIDEO_CALL, 30),
    socialIcon(IconEnum.TELEGRAM, 30),
    socialIcon(IconEnum.INSTAGRAM, 30),
    socialIcon(IconEnum.FACEBOOK, 30),
  ];
}
