

import 'package:delivery/datasourse/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _personalPageState();
}

class _personalPageState extends State<PersonalPage> {

  static User user = User(
      firstName: "Иванов",
      secondName: "Иван",
      patronymic: "Иванович",
      phone: "89999999999"
  );
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _sNameController = TextEditingController();
  final TextEditingController _patronymicController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();


  @override
  void initState() {
    super.initState();
    _fNameController.text = user.firstName;
    _sNameController.text = user.secondName;
    _patronymicController.text = user.patronymic;
    _phoneController.text = user.phone;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        // leadingWidth: 200,
        title: Text("Профиль", style: TextStyle(
            fontFamily: "Open Sans",
            fontWeight: FontWeight.w700,
            fontSize: 18
        ),),
      ),
      body: Container(
        color: Color.fromRGBO(225, 225, 225, 1.0),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey, // Цвет границы
                    width: 1.0, // Толщина границы
                  ),
                ),
                child: TextField(
                  controller: _fNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey, // Цвет границы
                    width: 1.0, // Толщина границы
                  ),
                ),
                child: TextField(
                  controller: _sNameController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey, // Цвет границы
                    width: 1.0, // Толщина границы
                  ),
                ),
                child: TextField(
                  controller: _patronymicController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey, // Цвет границы
                    width: 1.0, // Толщина границы
                  ),
                ),
                child: TextField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none
                      )
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    bottomSheet: Container(
      color: Color.fromRGBO(225, 225, 225, 1.0),
      child: Container(
        margin: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(8),
        ),
        // padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          child: TextButton(
            onPressed: () {
              user.firstName = _fNameController.text;
              user.secondName = _sNameController.text;
              user.patronymic = _patronymicController.text;
              user.phone = _phoneController.text;
            },
            child: Text(
              'Сохранить изменения',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    )
    );
  }

}

