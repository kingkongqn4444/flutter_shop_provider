import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novus_trade_v1/configs/SPref.dart';
import 'package:novus_trade_v1/configs/ui_icons.dart';
import 'package:novus_trade_v1/customs/clipShadowPath.dart';
import 'package:novus_trade_v1/customs/customClipper.dart';
import 'package:novus_trade_v1/network/apiCaller.dart';
import 'package:novus_trade_v1/provider/provider_user.dart';
import 'package:provider/provider.dart';

class SignInWidget extends StatefulWidget {
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends State<SignInWidget> {
  bool _isShowPass = false;
  final emailControler = TextEditingController();
  final passControler = TextEditingController();
  bool _validateEmail = false;
  bool _validatePass = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: SvgPicture.asset(
            'img/images/background.svg',
            width: MediaQuery.of(context).size.width,
            color: Color(0xffBD3CA6C8),
          ),
        ),
        Container(
          height: double.infinity,
          child: SingleChildScrollView(
              child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Stack(children: [
                    Column(
                      children: [
                        Image.asset(
                          "img/images/logo.png",
                          width: 120,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(tr("login_text_wellcome_to"),
                            style: Theme.of(context).textTheme.bodyText1.merge(
                                TextStyle(
                                    fontSize: 20, color: Color(0xFF429BE3)))),
                        SizedBox(
                          height: 20,
                        ),
                        Text(tr("login_text_sign_continue")),
                        Text(Provider.of<UserProvider>(context).getMessage(),
                            style: TextStyle(fontSize: 12, color: Colors.red)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 1,
                                  offset: Offset(
                                      0, 4), // changes position of shadow
                                ),
                              ]),
                          child: TextField(
                            style:
                                TextStyle(color: Theme.of(context).accentColor),
                            keyboardType: TextInputType.emailAddress,
                            controller: emailControler,
                            onChanged: (text) {
                              setState(() {
                                _validateEmail = false;
                              });
                              Provider.of<UserProvider>(context, listen: false)
                                  .setMessage("");
                            },
                            decoration: new InputDecoration(
                                hintText: tr("login_text_placeholder_email"),
                                errorText: _validateEmail
                                    ? 'Email Value Can\'t Be Empty'
                                    : null,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.2),
                                      width: 1.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Theme.of(context)
                                          .accentColor
                                          .withOpacity(0.5),
                                      width: 1.0),
                                ),
                                prefixIcon: Icon(
                                  UiIcons.envelope,
                                  color: Colors.grey.withOpacity(0.7),
                                ),
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .merge(TextStyle(color: Colors.grey))),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    blurRadius: 1,
                                    offset: Offset(
                                        0, 4), // changes position of shadow
                                  ),
                                ]),
                            child: TextField(
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                              keyboardType: TextInputType.visiblePassword,
                              controller: passControler,
                              obscureText: !_isShowPass,
                              onChanged: (text) {
                                setState(() {
                                  _validatePass = false;
                                });
                                Provider.of<UserProvider>(context,
                                        listen: false)
                                    .setMessage("");
                              },
                              decoration: new InputDecoration(
                                  hintText: tr("login_text_placeholder_pw"),
                                  errorText: _validatePass
                                      ? 'Pass Value Can\'t Be Empty'
                                      : null,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.2),
                                        width: 1.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Theme.of(context)
                                            .accentColor
                                            .withOpacity(0.5),
                                        width: 1.0),
                                  ),
                                  prefixIcon: Icon(
                                    UiIcons.padlock,
                                    color: Colors.grey.withOpacity(0.7),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _isShowPass = !_isShowPass;
                                      });
                                    },
                                    icon: Icon(_isShowPass
                                        ? Icons.visibility_off
                                        : Icons.visibility),
                                    color: Colors.grey.withOpacity(0.4),
                                  ),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .body1
                                      .merge(TextStyle(color: Colors.grey))),
                            )),
                        SizedBox(height: 20),
                        SizedBox(
                          height: 30,
                        ),
                        MaterialButton(
                          onPressed: () {
                            _doSignIn();
                          },
                          color: Theme.of(context).highlightColor,
                          child: Container(
                            height: 60,
                            width: double.infinity,
                            child: Center(
                                child: Text(
                              tr("login_text_button_login"),
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FlatButton(
                          onPressed: () {},
                          child: Text(tr("login_text_forgot_password"),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(tr("login_text_register_account")),
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                tr("login_button_register"),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ])
                ],
              ),
            ),
          ])),
        ),
      ]),
    );
  }

  void _doSignIn() {
    var name = emailControler.text;
    var pass = passControler.text;
    if (name.length == 0 || pass.length == 0) {
      setState(() {
        name.isEmpty ? _validateEmail = true : _validateEmail = false;
        pass.isEmpty ? _validatePass = true : _validatePass = false;
      });
    } else {
      ApiCaller().signIn(name, pass).then((user) async {
        if (user.token != null) {
          await SPref.instance.set("token", user.token).then((onValue) {
            if (onValue == true) {
              Provider.of<UserProvider>(context, listen: false).getInfomation();
              Navigator.of(context).pushNamed('/home', arguments: 2);
            }
          });
        }
      }).catchError((e) {
        Provider.of<UserProvider>(context, listen: false)
            .setMessage("Không đúng user hoặc password !!");
      });
    }
  }
}
