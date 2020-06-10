import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockjsondata.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class SettingPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserInfo userInfo = currentUserProfile();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeadingWidget(
            title: 'Settings',
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CircleAvatar(
                  radius: 30,
                  child: ClipOval(
                    child: CachedNetworkImage(
                      imageUrl: userInfo.picture.large,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${userInfo.name.first}',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      '${userInfo.name.last}',
                      style: TextStyle(fontSize: 30),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.black,
                  child: Text(
                    'Edit\nProfile',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Center(
            child: QrImage(
              data: userInfo.login.uuid,
              version: 5,
              size: 200,
              gapless: false,
              errorStateBuilder: (cxt, err) {
                return Container(
                  child: Center(
                    child: Text(
                      err.toString(),
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Column(
                children: <Widget>[socialIcon(IconEnum.QRCODE, 30), Text('Share')],
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              elevation: 2,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Privacy and Security',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              elevation: 2,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Notification',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              elevation: 2,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Preferences',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.grey,
              elevation: 2,
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Logout',
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
