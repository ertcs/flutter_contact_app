import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';
import 'package:fluttercontactapp/Pages/homepage/homepagemain.dart';

class SignInPageWidget extends StatefulWidget {
  @override
  _SignInPageWidgetState createState() => _SignInPageWidgetState();
}

class _SignInPageWidgetState extends State<SignInPageWidget> {
  bool isObscureText1 = false;
  TextEditingController _passController;

  @override
  void initState() {
    _passController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeadingWidget(
            title: 'Log in',
          ),
          Container(
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: new BorderRadius.circular(10.0),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          maxLines: 1,
                          cursorColor: Colors.black,
                          style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                          decoration: InputDecoration(border: InputBorder.none, labelText: 'Email', labelStyle: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      alignment: const Alignment(0, 0),
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              autovalidate: true,
                              controller: _passController,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21),
                              obscureText: isObscureText1,
                              onChanged: (value) {
                                if (value.length > 1) {
                                  setState(() {
                                    isObscureText1 = true;
                                  });
                                } else {
                                  isObscureText1 = false;
                                }
                              },
                              decoration:
                                  InputDecoration(border: InputBorder.none, labelText: 'Password', labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        isObscureText1
                            ? Positioned(
                                right: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscureText1 = !isObscureText1;
                                    });
                                  },
                                  child: Text(
                                    'SHOW',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Hero(
                    tag: 'Sign in',
                    child: LogInBtn(
                      title: 'Log in'.toUpperCase(),
                      function: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainHomePage()),
                        );
                      },
                      boxColor: Colors.indigoAccent,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.indigoAccent,
                        child: Center(
                            child: Icon(
                          FontAwesome.facebook,
                          color: Colors.white,
                        )),
                      ),
                      Container(
                        height: 50,
                        width: 50,
                        color: Colors.indigoAccent,
                        child: Center(
                            child: Icon(
                          FontAwesome.google,
                          color: Colors.white,
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        ' SIGN UP',
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
