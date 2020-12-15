part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SignIn"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ctrlEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Email',
                        hintText: "Write your active email ",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: ctrlPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Passwordl',
                        hintText: "input your password ",
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton.icon(
                      onPressed: () async {
                        if (ctrlEmail.text == "" || ctrlPassword.text == "") {
                          Fluttertoast.showToast(
                              msg: "Please fill all fields",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          String result = await AuthServices.signin(
                              ctrlEmail.text, ctrlPassword.text);
                          if (result == "success") {
                            Fluttertoast.showToast(
                              msg: "Login Sucess",
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 20.0,
                            );
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainMenu();
                            }));
                          } else {
                            Fluttertoast.showToast(
                              msg: result,
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 20.0,
                            );
                            setState(() {
                              isLoading = false;
                            });
                          }
                        }
                      },
                      icon: Icon(Icons.file_upload),
                      textColor: Colors.white,
                      color: Colors.blue[500],
                      label: Text("Sign in")),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already Registered? Sign up',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainHome();
                            }));
                          }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
