import 'package:cached_network_image/cached_network_image.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';
import 'package:fluttercontactapp/Pages/homepage/contactviewpage.dart';
import 'package:fluttercontactapp/Pages/homepage/createcontactwidget.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockjsondata.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class ContactsPage extends StatefulWidget {
  final List<UserInfo> mockRecentHistory;
  final List<CallHistoryDetailModel> callHistoryList;
  final List<UserInfo> mockUserInfoList;

  ContactsPage({@required this.mockRecentHistory, @required this.callHistoryList, @required this.mockUserInfoList});

  @override
  _ContactsPageState createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  List<UserInfo> mockUserInfoList = [];
  UserInfo userProfile;
  Future mockFuture;
  List<String> useName = [];
  FocusNode searchFocus;

  @override
  void initState() {
    super.initState();
    searchFocus = FocusNode();
    mockFuture = NetworkService.getData();
    userProfile = currentUserProfile();
    mockUserInfoList = widget.mockUserInfoList..sort((a, b) => a.name.first.toLowerCase().compareTo(b.name.first.toLowerCase()));
    mockUserInfoList.forEach((element) {
      useName.add(element.name.first);
    });
  }

  Future _scan() async {
    String barcode = await scanner.scan();
    UserInfo newContact = mockUserInfoList.firstWhere((element) => element.login.uuid.contains(barcode));
    print(newContact.name.first);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ContactViewPage(
                userInfo: newContact,
                index: 023,
                isNew: true,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Object>(
        future: mockFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      HeadingWidget(
                        title: 'Contacts',
                      ),
                      Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(MaterialCommunityIcons.barcode_scan),
                            onPressed: () {
                              _scan();
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CreateContactPage(),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Theme.of(context).canvasColor,
                      height: 50,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          focusNode: searchFocus,
                          autofocus: false,
                          textInputAction: TextInputAction.search,
                          onChanged: (searchValue) {
                            if (searchValue.isNotEmpty && searchValue.length > 1) {
                              setState(() {
                                mockUserInfoList = widget.mockUserInfoList
                                    .where((element) => element.name.first.toLowerCase().contains(searchValue.toLowerCase()))
                                    .toList();
                              });
                            } else {
                              setState(() {
                                mockUserInfoList = widget.mockUserInfoList;
                              });
                            }
                          },
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5, right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Recent',
                              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 75,
                        child: Padding(
                          padding: EdgeInsets.only(left: 8, right: 8),
                          child: ListView.builder(
                            padding: EdgeInsets.all(0),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: 50,
                            itemBuilder: (context, index) {
                              return Column(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: <Widget>[
                                        CircleAvatar(
                                          backgroundColor: Colors.black,
                                          radius: 15,
                                          child: ClipOval(
                                            child: CachedNetworkImage(
                                                imageUrl: widget.mockRecentHistory[index].picture.medium,
                                                placeholder: (context, url) {
                                                  return Center(
                                                    child: Text(
                                                      '${widget.mockRecentHistory[index].name.first[0]}',
                                                      style: TextStyle(color: Colors.white),
                                                    ),
                                                  );
                                                }),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        widget.callHistoryList[index].icon,
                                        Text(
                                          widget.callHistoryList[index].callTime,
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Contacts',
                          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                    },
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: mockUserInfoList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
                          child: ExpansionTileCard(
                            leading: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ContactViewPage(
                                            userInfo: mockUserInfoList[index],
                                            index: index,
                                          )),
                                );
                              },
                              child: Hero(
                                tag: '${mockUserInfoList[index].picture.large}$index',
                                child: CircleAvatar(
                                  radius: 22,
                                  child: ClipOval(
                                      child: CachedNetworkImage(
                                          imageUrl: mockUserInfoList[index].picture.large,
                                          placeholder: (context, url) {
                                            return Center(
                                              child: Text(
                                                '${mockUserInfoList[index].name.first[0]}',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            );
                                          })),
                                ),
                              ),
                            ),
                            title: Text(mockUserInfoList[index].name.first),
                            subtitle: Hero(tag: '${mockUserInfoList[index].phone}$index', child: Text(mockUserInfoList[index].phone)),
                            trailing: Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Icon(Icons.phone),
                            ),
                            children: <Widget>[
                              Divider(
                                thickness: 1.0,
                                height: 1.0,
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceAround,
                                buttonHeight: 52.0,
                                buttonMinWidth: 90.0,
                                children: index.isEven ? socialListTop1() : socialListTop2(),
                              ),
                              ButtonBar(
                                alignment: MainAxisAlignment.spaceAround,
                                buttonHeight: 52.0,
                                buttonMinWidth: 90.0,
                                children: index.isEven ? socialList1() : socialList2(),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ))
                ],
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
