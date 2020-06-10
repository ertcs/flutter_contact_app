import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/dailpadwidget.dart';
import 'package:fluttercontactapp/Pages/mockdata/mockuserinfomodel.dart';

class DialPage extends StatefulWidget {
  final List<UserInfo> mockUserInfoList;

  DialPage({@required this.mockUserInfoList});

  @override
  _DialPageState createState() => _DialPageState();
}

class _DialPageState extends State<DialPage> {
  List<UserInfo> mockUserInfoList = [];
  String searchValue = '';
  List<UserInfo> filteredList = [];

  @override
  void initState() {
    super.initState();

    mockUserInfoList = widget.mockUserInfoList;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        SizedBox(
          height: getHeight(50, height),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          child: searchValue.isNotEmpty && searchValue.length > 1
              ? ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: filteredList.length > 5 ? 5 : filteredList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 2, left: 8, right: 8),
                      child: Container(
                        height: getHeight(50, height),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: getHeight(20, height),
                              child: ClipOval(
                                  child: CachedNetworkImage(
                                imageUrl: filteredList[index].picture.medium,
                                placeholder: (context, url) {
                                  return Center(
                                    child: Text(
                                      '${filteredList[index].name.first[0]}',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  );
                                },
                              )),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  filteredList[index].name.first,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: getHeight(20, height),
                                  ),
                                ),
                                Text(filteredList[index].phone,
                                    style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: getHeight(16, height),
                                    )),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Container(),
        ),
        Expanded(
          child: DialPad(
            isDarkTheme: false,
            onNumberChange: (value) {
              setState(() {
                searchValue = value;
                if (searchValue.isNotEmpty && searchValue.length > 1) {
                  filteredList = mockUserInfoList.where((element) => element.cell.contains(value) || element.phone.contains(value)).toList();
                } else {
                  filteredList = [];
                }
              });
            },
          ),
        )
      ],
    );
  }
}

//class MyDialPad extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return DialPad(
//      isDarkTheme: false,
//      onNumberChange: (value) {
//        setState(() {
//          searchValue = value;
//          if(searchValue.isNotEmpty && searchValue.length>1){
//            filteredList = mockUserInfoList.where((element) => element.cell.contains(value)||element.phone.contains(value)).toList();
//          }else{
//            filteredList =[];
//          }
//        });
//      },
//    );
//  }
//}
