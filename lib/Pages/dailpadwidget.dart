import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fluttercontactapp/Pages/common/commonconstant/commonfunction.dart';

class DialPad extends StatefulWidget {
  final bool isDarkTheme;
  final Function onNumberChange;

  DialPad({this.isDarkTheme, this.onNumberChange});

  @override
  _DialPadState createState() => _DialPadState();
}

class _DialPadState extends State<DialPad> {
  String inputNumber = '';
  String inputText = '';
  var maskedController = MaskedTextController(mask: '000-000-0000');

  @override
  void initState() {
    super.initState();
    maskedController.text = inputNumber;
//
  }

  tapTextChange(String addString) {
    String prvString = maskedController.text.toString();
    String newString = '$prvString$addString';
    setState(() {
      maskedController.text = newString;
      widget.onNumberChange(newString);
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        TextField(
          enabled: false,
          textAlign: TextAlign.center,
          controller: maskedController,
          style: TextStyle(fontSize: getHeight(40, height), letterSpacing: 2.0, color: Colors.black),
          maxLines: 1,
          onChanged: widget.onNumberChange,
          decoration: InputDecoration(
            border: InputBorder.none,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DialPadBtn(
              isSingle: true,
              numberTitle: '1',
              onTapFunction: () {
                tapTextChange('1');
              },
              textTitle: '',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '2',
              onTapFunction: () {
                tapTextChange('2');
              },
              textTitle: 'ABC',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '3',
              onTapFunction: () {
                tapTextChange('3');
              },
              textTitle: 'DEF',
              isDarkTheme: widget.isDarkTheme,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DialPadBtn(
              isSingle: false,
              numberTitle: '4',
              onTapFunction: () {
                tapTextChange('4');
              },
              textTitle: 'GHI',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '5',
              onTapFunction: () {
                tapTextChange('5');
              },
              textTitle: 'JKL',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '6',
              onTapFunction: () {
                tapTextChange('6');
              },
              textTitle: 'MNO',
              isDarkTheme: widget.isDarkTheme,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DialPadBtn(
              isSingle: false,
              numberTitle: '7',
              onTapFunction: () {
                tapTextChange('7');
              },
              textTitle: 'PQRS',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '8',
              onTapFunction: () {
                tapTextChange('8');
              },
              textTitle: 'TYUV',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '9',
              onTapFunction: () {
                tapTextChange('9');
              },
              textTitle: 'WXYZ',
              isDarkTheme: widget.isDarkTheme,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DialPadBtn(
              isSingle: true,
              numberTitle: '*',
              onTapFunction: () {
                tapTextChange('*');
              },
              textTitle: 'PQRS',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: false,
              numberTitle: '0',
              onTapFunction: () {
                tapTextChange('0');
              },
              textTitle: '+',
              isDarkTheme: widget.isDarkTheme,
            ),
            DialPadBtn(
              isSingle: true,
              numberTitle: '#',
              onTapFunction: () {
                tapTextChange('#');
              },
              textTitle: 'WXYZ',
              isDarkTheme: widget.isDarkTheme,
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            DialPadBtn(
              isSingle: true,
              numberTitle: '',
              onTapFunction: () {},
              textTitle: 'PQRS',
              isDarkTheme: true,
            ),
            InkWell(
              onTap: () {},
              child: CircleAvatar(
                radius: getHeight(26, height),
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                String prvString = maskedController.text.toString();
                if (prvString.isNotEmpty && prvString.length > 0) {
                  String newString = prvString.substring(0, prvString.length - 1);
                  setState(() {
                    maskedController.text = newString;
                    widget.onNumberChange(newString);
                  });
                }
              },
              child: CircleAvatar(
                radius: getHeight(26, height),
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.backspace,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class DialPadBtn extends StatelessWidget {
  final bool isSingle;
  final String numberTitle;
  final String textTitle;
  final Function onTapFunction;
  final bool isDarkTheme;

  DialPadBtn({@required this.isSingle, @required this.numberTitle, @required this.textTitle, @required this.onTapFunction, this.isDarkTheme = false});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: onTapFunction,
      child: CircleAvatar(
        radius: getHeight(26, height),
        backgroundColor: getBackgroundColor(isDarkTheme),
        child: isSingle
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    numberTitle,
                    style: TextStyle(color: getTextColor(isDarkTheme), fontSize: getHeight(18, height)),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    numberTitle,
                    style: TextStyle(color: getTextColor(isDarkTheme), fontSize: getHeight(18, height)),
                  ),
                  Text(
                    textTitle,
                    style: TextStyle(color: getTextColor(isDarkTheme), fontSize: getHeight(12, height)),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}

//width: 411.42857142857144, height: 843.4285714285714
