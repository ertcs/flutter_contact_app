import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttercontactapp/Pages/common/commonwidget/commonwidgetspage.dart';

class CreateContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HeadingWidget(
                  title: 'Add Contact',
                ),
                Center(
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.add_photo_alternate,
                          size: 50,
                        ),
                        Text('ADD IMAGE')
                      ],
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 8, left: 20, right: 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'First Name',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Last Name',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.phone),
                                border: InputBorder.none,
                                labelText: 'Mobile Number',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: InputBorder.none,
                                labelText: 'email',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 20, right: 20, top: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.3),
                            borderRadius: new BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5, left: 5),
                            child: TextFormField(
                              cursorColor: Colors.black,
                              style: TextStyle(color: Colors.black, fontSize: 21, fontWeight: FontWeight.w500),
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.cake),
                                border: InputBorder.none,
                                labelText: 'Birthday',
                                labelStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 5,
            left: 5,
            right: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () {},
                  child: Text('Add Other Filed', style: TextStyle(color: Colors.redAccent, fontSize: 24)),
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {},
                  color: Colors.black,
                  child: Container(
                    height: 50,
                    child: Center(
                        child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
