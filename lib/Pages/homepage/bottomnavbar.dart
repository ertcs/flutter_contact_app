import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';

class BottomBarNav extends StatefulWidget {
  final Function onBarTap;

  BottomBarNav(this.onBarTap);

  @override
  _BottomBarNavState createState() => _BottomBarNavState();
}

class _BottomBarNavState extends State<BottomBarNav> with TickerProviderStateMixin {
  int selectedBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 10, top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedBarIndex = 0;
                widget.onBarTap(0);
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12.0),
              duration: Duration(milliseconds: 400),
              decoration:
                  BoxDecoration(color: selectedBarIndex == 0 ? lightColor : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  selectedBarIndex == 0 ? Text("") : getSelectedIcon(selectedBarIndex == 0, darkColor, Icons.dialpad),
                  AnimatedSize(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      vsync: this,
                      child: selectedBarIndex == 0 ? TabText("keypad", Colors.white) : Text(''))
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedBarIndex = 1;
                widget.onBarTap(1);
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12.0),
              duration: Duration(milliseconds: 400),
              decoration:
                  BoxDecoration(color: selectedBarIndex == 1 ? lightColor : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  selectedBarIndex == 1 ? Text("") : getSelectedIcon(selectedBarIndex == 1, darkColor, Icons.people),
                  AnimatedSize(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      vsync: this,
                      child: selectedBarIndex == 1 ? TabText("contacts", Colors.white) : Text(''))
                ],
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              setState(() {
                selectedBarIndex = 2;
                widget.onBarTap(2);
              });
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: 28, vertical: 12.0),
              duration: Duration(milliseconds: 400),
              decoration:
                  BoxDecoration(color: selectedBarIndex == 2 ? lightColor : Colors.transparent, borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  selectedBarIndex == 2 ? Text("") : getSelectedIcon(selectedBarIndex == 2, darkColor, Icons.settings),
                  AnimatedSize(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      vsync: this,
                      child: selectedBarIndex == 2 ? TabText("setting", Colors.white) : Text(''))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
