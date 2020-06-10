import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ShareContactPage extends StatelessWidget {
  final UserInfo userInfo;

  ShareContactPage({@required this.userInfo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 50,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: userInfo.picture.large,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
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
          SizedBox(
            height: 20,
          ),
          Center(
            child: QrImage(
              data: userInfo.login.uuid,
              version: 5,
              size: 300,
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
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Container(
                width: 100,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Share\nQR Code',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )),
              ),
              Container(
                width: 100,
                decoration: BoxDecoration(color: Colors.black, borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(
                    'Share\nContact',
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
