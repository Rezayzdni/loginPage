import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  var userController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordError;
  var userError;
  var message = SnackBar(content: Text("Successful!"),);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Entry Page"),
        backgroundColor: Colors.lightBlue[400],
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(20.0),),
            Center(
              child: Image.asset('assets/flutter_logo_0.png',width: 200.0),
            ),
            Padding(padding: EdgeInsets.all(20.0),),
            Container(
              margin: EdgeInsets.only(left: 15.0,right: 18.0),
              child: TextField(controller: userController,showCursor: true,
                textAlign: TextAlign.center,decoration: InputDecoration(labelText: "UserName",errorText: userError,
                hintText: "Type Your Username",
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.green,style: BorderStyle.solid,width: 2.0)),
              ) ,),
            ),
            Padding(padding: EdgeInsets.all(10.0),),
            Container(
              margin: EdgeInsets.only(left: 15.0,right: 18.0),
              child: TextField(controller: passwordController,showCursor: true,obscureText: true,
                textAlign: TextAlign.center,decoration: InputDecoration(errorText: passwordError,
                labelText: 'Password', hintText: 'Type Your Password',
                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    borderSide: BorderSide(color: Colors.green)),
              ) ,),
            ),
            Padding(padding: EdgeInsets.all(18.0),),
            Center(
              child: Text("Forgot your password?",style: TextStyle(color: Colors.blueAccent,decoration: TextDecoration.underline),),
            ),
            Padding(padding: EdgeInsets.all(28.0),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                OutlineButton(
                  textColor: Colors.black,
                  highlightColor: Colors.green,
                  splashColor: Colors.green,
                  focusColor: Colors.blue,
                  hoverColor: Colors.blue,
                  child: Text("SignIn",),
                  //padding: const EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  borderSide: BorderSide(
                    color: Colors.blue
                  ),
                  onPressed: () {
                    print("${userController.text}");
                    setState(() {
                      if(userController.text.length<4){
                        passwordError = null;
                        userError = "Your username length must be a tleast 4 ";
                      }
                      else if((passwordController.text.length < 4) && (userController.text.length<4)){
                        userError = "Your username length must be a tleast 4 ";
                        passwordError = "Your password length must be at least 4 ";
                      }
                      else{
                        userError = null;
                        passwordError = null;
                        scaffoldKey.currentState.showSnackBar(message);
                      }

                    });
                  },
                ),
                OutlineButton(
                  textColor: Colors.black,
                  highlightColor: Colors.green,
                  splashColor: Colors.green,
                  focusColor: Colors.blue,
                  hoverColor: Colors.blue,
                 // visualDensity: VisualDensity(horizontal: 5.0,vertical: 5.0),
                  child: Text("SignUp"),
                  padding: const EdgeInsets.all(5.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                  borderSide: BorderSide(
                      color: Colors.blue
                  ),
                  onPressed: () {
                    print("${userController.text}");
                    setState(() {
                      if(userController.text.length<4){
                        passwordError = null;
                        userError = "Your username length must be a tleast 4 ";
                      }
                      else if(passwordController.text.length < 4){
                        userError = null;
                        passwordError = "Your password length must be at least 4 ";
                      }
                      else if((passwordController.text.length < 4) && (userController.text.length<4)){
                        userError = "Your username length must be a tleast 4 ";
                        passwordError = "Your password length must be at least 4 ";
                      }
                      else{
                        userError = null;
                        passwordError = null;
                        scaffoldKey.currentState.showSnackBar(message);
                      }
                     // scaffoldKey.currentState.showSnackBar(message);
                    });
                  },
                )
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.0),),
           Center(child: Padding(padding: EdgeInsets.only(top: 200.0),child: Text("Powered by ❤",),),)
          ],
        ),
      ),
      backgroundColor: Colors.lightBlue[100],
    );
  }
}



