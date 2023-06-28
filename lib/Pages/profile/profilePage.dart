

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/Pages/profile/personalPage.dart';

class ProfilePage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _profilePageState();

}

class _profilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: EdgeInsets.only(left: 25, top: 16),
          child: Text("Профиль", style: TextStyle(
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(

            margin: EdgeInsets.fromLTRB(16, 22, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Обработчик нажатия для первой кнопки
                    Navigator.pushNamed(context, "/personal");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/User.png"),
                      SizedBox(width: 10),
                      Text('Персональные данные', style: TextStyle(
                        fontFamily: "Open sans",
                        fontSize: 18,

                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(

            margin: EdgeInsets.fromLTRB(16, 22, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Обработчик нажатия для первой кнопки
                    print('Button 2 tapped');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/ph_phone.png"),
                      SizedBox(width: 10),
                      Text('Поддержка', style: TextStyle(
                        fontFamily: "Open sans",
                        fontSize: 18,

                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(

            margin: EdgeInsets.fromLTRB(16, 22, 0, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    // Обработчик нажатия для первой кнопки
                    print('Button 2 tapped');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/exit.png"),
                      SizedBox(width: 10),
                      Text('Выйти', style: TextStyle(
                        fontFamily: "Open sans",
                        fontSize: 18,

                      ),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

