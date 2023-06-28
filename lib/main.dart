import 'package:flutter/material.dart';
// import 'package:delivery/Pages/mapPage.dart';
import 'package:delivery/Pages/mainScreen.dart';
import 'package:delivery/Pages/Orders/newOrders.dart';
import 'package:delivery/Pages/Orders/orderDetail.dart';
import 'package:delivery/Pages/profile/profilePage.dart';
import 'package:delivery/Pages/profile/personalPage.dart';
import 'package:delivery/datasourse/Order.dart';
import 'package:delivery/datasourse/Product.dart';


void main() {
  runApp(const MyApp());
}

class OrdersList {
  static List<Order> listOrders = [
    Order(
        Id: 11,
        products: [
          Product(
              Id: 0,
              price: 100,
              name: "Картошка фри",
              count: 1
          ),
          Product(
              Id: 1,
              price: 150,
              name: "Чизбургер",
              count: 1
          ),
          Product(
              Id: 2,
              price: 100,
              name: "Кока-кола 0.5",
              count: 1
          ),

        ],
        discount: 0,
        paymentMethod: "По карте"
    ),
    Order(
        Id: 12,
        products: [
          Product(
              Id: 0,
              price: 400,
              name: "Баскет дуэт",
              count: 1
          ),

          Product(
              Id: 2,
              price: 100,
              name: "Кока-кола 0.5",
              count: 4
          ),

        ],
        discount: 10,
        paymentMethod: "Наличными"
    ),
    Order(
        Id: 13,
        products: [
          Product(
              Id: 0,
              price: 100,
              name: "Шевбургер",
              count: 3
          ),
          Product(
              Id: 1,
              price: 150,
              name: "Картофель фри",
              count: 2
          ),
          Product(
              Id: 2,
              price: 80,
              name: "Напиток байкал 1.5 л.",
              count: 1
          ),

        ],
        discount: 0,
        paymentMethod: "По карте"
    ),
    Order(
        Id: 14,
        products: [
          Product(
              Id: 0,
              price: 432,
              name: "Комбо с Биг Маестро",
              count: 1
          ),
          Product(
              Id: 1,
              price: 89,
              name: "3 соуса по цене 2-х",
              count: 1
          ),
          Product(
              Id: 2,
              price: 89,
              name: "Фрустайл Апельсин",
              count: 2
          ),
          Product(
              Id: 3,
              price: 95,
              name: "Мороженое Клубничное",
              count: 1
          ),
        ],
        discount: 0,
        paymentMethod: "По карте"
    ),
    Order(
        Id: 15,
        products: [
          Product(
              Id: 0,
              price: 259,
              name: "Боксмастер острый",
              count: 2
          )

        ],
        discount: 0,
        paymentMethod: "Наличными"
    ),

  ];
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: Orders(),
      initialRoute: "/",
      routes: {
        "/": (BuildContext context) => HomePage(),
        "/newOrders": (BuildContext context) => NewOrders(),
        "/orderDetail": (BuildContext context) => OrderDetail(),
        "/profile": (BuildContext context) => ProfilePage(),
        "/personal": (BuildContext context) => PersonalPage(),
      },
    );
  }
}
