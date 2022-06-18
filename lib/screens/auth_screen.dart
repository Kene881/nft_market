import 'package:flutter/material.dart';

class AuthorizationScreen extends StatefulWidget {
  AuthorizationScreen({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  TextEditingController _emailController = TextEditingController(); 
  TextEditingController _passwordController = TextEditingController(); 

  String? _email;
  String? _password;
  bool? _showLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          _logo(),
          (_showLogin == true) ?
              Column(
                children: [
                  _form('LOGIN', _action),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        'Not registered yet? Register',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showLogin = false;
                        });
                      },
                    ),
                  )
                ],
              ) :
              Column(
                children: [
                  _form('REGISTER', _action),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: GestureDetector(
                      child: Text(
                        'Already registered? Login',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      onTap: () {
                        setState(() {
                          _showLogin = true;
                        });
                      },
                    ),
                  )
                ],
              )
          // _form('LOGIN', _action),
        ],
      ),
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Container(
        child: Align(
          child: Text(
            'NFT MARKET',
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _form(String label, void func()) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20, top: 10),
            child: _input(Icon(Icons.email), 'email', _emailController, false),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: _input(Icon(Icons.lock), 'password', _passwordController, true),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20,),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: _button(label, func), 
            ),
          )
        ],
      ),
    );
  }

  Widget _input(Icon icon, String hint, TextEditingController controller, bool isHide) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        controller: controller,
        obscureText: isHide,
        style: const TextStyle(fontSize: 20, color: Colors.white),
        decoration: InputDecoration(
          hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 3)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white54, width: 1)
          ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10,),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: icon,
            ),
          )
        ),
      ),
    );
  }

  Widget _button(String label, void func()) {
    return ElevatedButton(
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 20,),
      ),
      onPressed: () {
        func();
      },
    );
  }

  void _action() {
    _email = _emailController.text;
    _password = _passwordController.text;

    _emailController.clear();
    _passwordController.clear();
  }
}
