import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';
import 'package:fluttercontactapp/Pages/homepage/sharecontactpage.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';

class ContactViewPage extends StatefulWidget {
  final UserInfo userInfo;
  final int index;
  final bool isNew;

  ContactViewPage({@required this.userInfo, this.index, this.isNew = false});

  @override
  _ContactViewPageState createState() => _ContactViewPageState();
}

class _ContactViewPageState extends State<ContactViewPage> with TickerProviderStateMixin {
  TabController _tabController;
  bool isNotificationOn = false;

  @override
  Widget build(BuildContext context) {
    String address = '${widget.userInfo.location.city}, ${widget.userInfo.location.country}';
    return Scaffold(
        body: Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Hero(
              tag: '${widget.userInfo.picture.large}${widget.index}',
              child: Container(
                width: double.infinity,
                color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.4,
                child: CachedNetworkImage(
                  imageUrl: widget.userInfo.picture.large,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.black45.withOpacity(0.2),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          Icons.keyboard_backspace,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.black45.withOpacity(0.2),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black45.withOpacity(0.2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShareContactPage(
                                    userInfo: widget.userInfo,
                                  ),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 1,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black45.withOpacity(0.5)],
                      stops: [0.1, 0.9]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget.userInfo.name.first,
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      Text(widget.userInfo.phone, style: TextStyle(color: Colors.white, fontSize: 20)),
                      Text(address, style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          child: TabBar(
            labelPadding: EdgeInsets.all(10),
            controller: _tabController,
            indicatorColor: Colors.redAccent,
            labelStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
            labelColor: Colors.redAccent,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            tabs: [
              Text(
                'Details',
              ),
              Text('Call Logs'),
            ],
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              SocialIconList(
                userInfo: widget.userInfo,
                index: widget.index,
              ),
              UserRecentCallList(
                userInfo: widget.userInfo,
                index: widget.index,
              )
            ],
          ),
        )
      ],
    ));
  }

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class SocialIconList extends StatelessWidget {
  final UserInfo userInfo;
  final int index;

  SocialIconList({this.userInfo, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(
                        child: Icon(
                      Icons.call,
                      size: 30,
                    )),
                  ),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          userInfo.phone,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Mobile Number , US',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Icon(
                          Icons.video_call,
                          size: 24,
                          color: Colors.black,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Icon(
                          Icons.sms,
                          size: 24,
                          color: Colors.black,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.black.withOpacity(0.3),
                        child: Center(
                            child: Icon(
                          Icons.phone,
                          size: 24,
                          color: Colors.black,
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.WHATSAPP, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          userInfo.phone,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Mobile Number , US',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.video_call,
                          size: 24,
                          color: Colors.green,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.sms,
                          size: 24,
                          color: Colors.green,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.green.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.call,
                          size: 24,
                          color: Colors.green,
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.FACEBOOK, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '@${userInfo.name.first.toLowerCase()}_${userInfo.name.last.toLowerCase()}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          FontAwesome.facebook,
                          size: 24,
                          color: Colors.blue,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.SKYPE, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'live.${userInfo.name.first.toLowerCase()}${userInfo.name.last.toLowerCase()}',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.video_call,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.sms,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.phone,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.VIBER, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          userInfo.cell,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Viber Number',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.video_call,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.sms,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.deepPurple.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.phone,
                          size: 24,
                          color: Colors.deepPurple,
                        ))),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.GMAIL, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${userInfo.name.first.toLowerCase()}@.gmail.com',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.red.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.mail,
                          size: 24,
                          color: Colors.red,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 1,
            child: Container(
              padding: EdgeInsets.all(8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                    flex: 1,
                    child: Center(child: socialIcon(IconEnum.EMAIL, 30)),
                  ),
                  Flexible(
                    flex: 6,
                    child: Wrap(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${userInfo.name.first.toLowerCase()}@.work.com',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                  Flexible(
                    flex: 1,
                    child: CircleAvatar(
                        backgroundColor: Colors.blue.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                          Icons.mail,
                          size: 24,
                          color: Colors.blue,
                        ))),
                  ),
                  Flexible(
                    flex: 1,
                    child: Center(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserRecentCallList extends StatelessWidget {
  final UserInfo userInfo;
  final int index;

  UserRecentCallList({this.userInfo, this.index});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_received,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '2 Min Ago',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.sms,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '5 Min Ago',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.phone_missed,
                    size: 24,
                    color: Colors.red,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '10 Min Ago',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.missed_video_call,
                    size: 24,
                    color: Colors.red,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20, color: Colors.red),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '10 Min Ago',
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_made,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '1 hr Ago',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_received,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      '3 hr Ago',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_made,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      'Yesterday',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_made,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      'Yesterday',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_made,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      'Yesterday',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            padding: EdgeInsets.all(8),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Center(
                      child: Icon(
                    Icons.call_made,
                    size: 24,
                  )),
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        userInfo.phone,
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        'Mobile Number , US',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      'Yesterday',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
