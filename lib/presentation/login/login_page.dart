import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:golden_island/presentation/sj/sj_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;
  late Dio _dio;

  @override
  void initState() {
    _dio = Dio();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _usernameController,
              ),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
              ),
              FlatButton(
                  onPressed: () async {
                    Response _response;
                    _response = await _dio.post(
                        "https://app.goldenisland.site/index.php/login",
                        data: {
                          "username": _usernameController.text,
                          "password": _passwordController.text
                        });

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => SjPage()));
                  },
                  child: Text("Masuk"))
            ],
          ),
        ));
  }
}
