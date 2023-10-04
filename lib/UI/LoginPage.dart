import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../HomePage/HomePageBloc.dart';
import '../Login/LoginBloc.dart';
import '../Login/LoginEvent.dart';
import 'HomePage.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginBloc = BlocProvider.of<LoginBloc>(context);


    return Scaffold(
      appBar: AppBar(
        title: Text('Đăng nhập'),
      ),
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 150.0,
              width: 150.0,
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/OOjs_UI_icon_userAvatar-constructive.svg/2048px-OOjs_UI_icon_userAvatar-constructive.svg.png',
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 300,
              width: 300,
              child: Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Tên người dùng',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final homePageBloc = HomePageBloc();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage(endpoint: '', bloc: homePageBloc)),
                        );
                      },
                      child: Text('Đăng nhập'),
                    ),

                    ElevatedButton(
                      onPressed: () {
                        loginBloc.add(LoginEvent());
                      },
                      child: Text('Đăng ký'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
