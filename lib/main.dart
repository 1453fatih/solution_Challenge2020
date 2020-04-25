import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'Dashboard.dart';

import 'package:url_launcher/url_launcher.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smarter Temperature',
      theme: ThemeData(
        primarySwatch: Colors.teal, //renk
      ),
      home: LoginScreen(title: 'Esp8266 && firebase && flutter'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatefulWidget {
  final String title;
  LoginScreen({Key key, this.title}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>['email'],
  );

  GoogleSignInAccount _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount account) {
      setState(() {
        _currentUser = account;
      });

      if (_currentUser != null) {
        _handleFirebase();
      }
    });

    // _googleSignIn.signInSilently();
  }

  void _handleFirebase() async {
    GoogleSignInAuthentication googleAuth = await _currentUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;

    if (firebaseUser != null) {
      print('Login');

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Dashboard()));
    }
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  void launchYoutube() async {
    const url =
        "https://www.youtube.com/channel/UCqgCTdcJjtPLdP715xc8YjQ?view_as=subscriber";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "Could not launch $url";
    }
  }

  void launhMyGames() async {
    const url =
        "https://en.wikipedia.org/wiki/List_of_emergency_telephone_numbers";
    if (await canLaunch(Uri.encodeFull(url))) {
      await launch(url);
    } else {
      throw "colund not launch $url";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Fire Alarm - Follow Temperature"),
        ),

       

        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/login/fsm.png"),
              new Text(
                'Technology',
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                  height: -1,
                ),
              ),
              new Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton.icon(
                    onPressed: () {
                      _handleSignIn();
                    },
                    label: Text("Sign İn "),
                    textColor: Colors.black,
                    color: Colors.lightBlueAccent,
                    icon: Icon(
                      Icons.android,
                    ),
                  ),
                  RaisedButton.icon(
                    onPressed: () {
                      launhMyGames();
                    },
                    color: const Color.fromARGB(255, 26, 35, 126),
                    textColor: Colors.white,
                    label: Text("Emergency Numbers"),
                    icon: Icon(Icons.call),
                  ),
                  new RaisedButton(
                    onPressed: () { launchYoutube(); },
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    child: new Text(
                      "Subscribe",
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
