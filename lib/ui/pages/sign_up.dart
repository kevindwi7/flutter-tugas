part of 'pages.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlName.dispose();
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
          title: Text("SignUp"),
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
                  TextFormField(
                    controller: ctrlName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Fullname',
                        hintText: "Write your full name ",
                        border: OutlineInputBorder()),
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
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  RaisedButton.icon(
                      onPressed: () async {
                        if (ctrlName.text == "" ||
                            ctrlEmail.text == "" ||
                            ctrlPassword.text == "") {
                          Fluttertoast.showToast(
                              msg: "Please fill all fields",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          String result = await AuthServices.signup(
                              ctrlEmail.text, ctrlPassword.text, ctrlName.text);
                          if (result == 'success') {
                            Fluttertoast.showToast(
                                msg: "Sign up succesfull",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0);

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
                          }
                        }
                      },
                      icon: Icon(Icons.file_upload),
                      textColor: Colors.white,
                      color: Colors.blue[500],
                      label: Text("Sign Up")),
                  SizedBox(
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return SignInPage();
                      }));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Already Registered? Sign in',
                        style: TextStyle(color: Colors.blue),
                        // recognizer: TapGestureRecognizer()
                        //   ..onTap = () {
                        //     Navigator.pushReplacement(context,
                        //         MaterialPageRoute(builder: (context) {
                        //       return SignInPage();
                        //     }));
                        //   }
                      ),
                    ),
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
