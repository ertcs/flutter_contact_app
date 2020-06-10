import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';

class Signupwidget extends StatefulWidget {
  @override
  _SignupwidgetState createState() => _SignupwidgetState();
}

class _SignupwidgetState extends State<Signupwidget> {
  TextEditingController _passController;
  TextEditingController _pass1Controller;
  bool isObscureText1 = false;
  bool isObscureText2 = false;

  @override
  void initState() {
    _passController = TextEditingController();
    _pass1Controller = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _pass1Controller.dispose();
    _passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HeadingWidget(
            title: 'Sign Up',
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
                              onChanged: (value) {
                                if (value.length > 1) {
                                  setState(() {
                                    isObscureText2 = true;
                                  });
                                } else {
                                  isObscureText2 = false;
                                }
                              },
                              controller: _pass1Controller,
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21),
                              obscureText: isObscureText2,
                              decoration:
                                  InputDecoration(border: InputBorder.none, labelText: 'Password', labelStyle: TextStyle(color: Colors.black)),
                            ),
                          ),
                        ),
                        isObscureText2
                            ? Positioned(
                                right: 15,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isObscureText2 = !isObscureText2;
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
                      tag: 'Sign up',
                      child: IconSignUpBtn(
                        title: 'Sign up with email',
                        boxColor: Colors.deepPurpleAccent,
                        function: () {},
                        iconData: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  IconSignUpBtn(
                    title: 'Sign up with Facebook',
                    boxColor: Colors.blueAccent,
                    function: () {},
                    iconData: Icon(
                      FontAwesome.facebook_square,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconSignUpBtn(
                    title: 'Sign up with Google',
                    boxColor: Colors.blueAccent,
                    function: () {},
                    iconData: Icon(
                      FontAwesome.google,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
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
