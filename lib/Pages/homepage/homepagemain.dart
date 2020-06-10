import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/homepage/bottomnavbar.dart';
import 'package:fluttercontactapp/Pages/homepage/contactpagewidget.dart';
import 'package:fluttercontactapp/Pages/homepage/dailpagemain.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockjsondata.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';
import 'package:fluttercontactapp/Pages/settingpage/settingpagemain.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  PageController _pageController;
  List<UserInfo> mockRecentHistory = [];
  List<CallHistoryDetailModel> callHistoryList = [];
  List<UserInfo> mockUserInfoList = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, keepPage: true);
    mockUserInfoList = userDataList();
    mockRecentHistory = recentCallList();
    callHistoryList = recentCallData(DateTime.now());
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            DialPage(
              mockUserInfoList: mockUserInfoList,
            ),
            ContactsPage(
              mockRecentHistory: mockRecentHistory,
              callHistoryList: callHistoryList,
              mockUserInfoList: mockUserInfoList,
            ),
            SettingPageWidget()
          ],
        ),
      ),
      bottomNavigationBar: BottomBarNav((index) {
        _pageController.jumpToPage(index);
      }),
    );
  }
}
