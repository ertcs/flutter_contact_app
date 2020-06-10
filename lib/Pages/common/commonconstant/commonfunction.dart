import 'dart:math';

import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class CallHistoryDetailModel {
  String callTime;
  Icon icon;

  CallHistoryDetailModel({this.callTime, this.icon});
}

List<CallHistoryDetailModel> recentCallData(DateTime dateTime) {
  List<CallHistoryDetailModel> callList = [];
  for (int i = 0; i < 50; i++) {
    Random random = new Random();
    int randomNumber = random.nextInt(15);
    DateTime dateTimeNew = dateTime.subtract(Duration(minutes: randomNumber));
    dateTime = dateTimeNew;
    String callTime = timeago.format(dateTimeNew);
    Icon callIcon = getRandomIcon();
    callList.add(CallHistoryDetailModel(callTime: callTime, icon: callIcon));
    dateTime = dateTimeNew;
  }
  return callList;
}

List<Icon> iconsList = [
  Icon(
    Icons.video_call,
    size: 15,
  ),
  Icon(
    Icons.missed_video_call,
    size: 15,
    color: Colors.red,
  ),
  Icon(
    Icons.call_made,
    size: 15,
  ),
  Icon(
    Icons.call_missed,
    size: 15,
    color: Colors.red,
  ),
  Icon(
    Icons.call_received,
    size: 15,
  ),
  Icon(
    Icons.sms,
    size: 15,
  )
];

Icon getRandomIcon() {
  Random random = new Random();
  int randomNumber = random.nextInt(6);
  return iconsList[randomNumber];
}

getSelectedIcon(bool isSelected, Color iconcolor, IconData icon) {
  return isSelected ? Icon(icon, color: iconcolor, size: 35) : Icon(icon, color: Colors.black45, size: 25);
}

Color getBackgroundColor(bool isDarkTheme) {
  return isDarkTheme ? Colors.white : Colors.black;
}

Color getTextColor(bool isDarkTheme) {
  return isDarkTheme ? Colors.black : Colors.white;
}

class NetworkService {
  static Future getData() async {
    return await Future.delayed(Duration(milliseconds: 400));
  }
}

enum IconEnum {
  ADD_CONTACT,
  EMAIL,
  FACEBOOK,
  GMAIL,
  GOOGLE,
  HANGOUT,
  INSTAGRAM,
  LINEDIN,
  MYSPACE,
  OUTLOOK,
  PINTEREST,
  QRCODE,
  REDDIT,
  SNAPCHAT,
  TELEGRAM,
  TICTOK,
  TWITTER,
  VIBER,
  WECHAT,
  WHATSAPP,
  YOUTUBE,
  SKYPE,
  SMS,
  VIDEO_CALL,
}

double getHeight(double size, double screenHeight) {
  return size * screenHeight / 843.4285714285714;
}
//width: 411.42857142857144, height: 843.4285714285714

const darkColor = Colors.white;
const lightColor = Colors.black;
