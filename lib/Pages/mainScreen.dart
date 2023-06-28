import 'package:delivery/datasourse/Order.dart';
import "package:flutter/material.dart";
import 'package:delivery/Pages/Orders/newOrders.dart';
import 'package:delivery/Pages/profile/profilePage.dart';
import 'package:delivery/Pages/Orders/orderDetail.dart';
import 'package:delivery/main.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    Orders(),
    NewOrders(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home_outlined),
              color: _currentIndex == 0 ? Colors.green : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              color: _currentIndex == 1 ? Colors.green : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 1;
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.account_box_rounded),
              color: _currentIndex == 2 ? Colors.green : Colors.grey,
              onPressed: () {
                setState(() {
                  _currentIndex = 2;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


class Orders extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _ordersState();

}

class _ordersState extends State<Orders> {
  int _selectedIndex = 0;

  void _onButtonPressed(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }


  @override
  Widget build(BuildContext context) {
    Order ords = OrdersList.listOrders[0];
    double amount = 0;

    for(int i=0;i<ords.products.length;i++){
      amount += ords.products[i].price;
    }

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: EdgeInsets.only(left: 25, top: 16),
          child: Text("Заказы", style: TextStyle(
              fontFamily: "Open Sans",
              fontWeight: FontWeight.w700,
              fontSize: 18
          ),),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search))
        ],
      ),
      body: Container(
        color: Color.fromRGBO(231, 231, 231, 1.0),
        child: Column(

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () => _onButtonPressed(0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 0 ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Текущие",
                      style: TextStyle(
                        color: _selectedIndex == 0 ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed(1),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 1 ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "В пути",
                      style: TextStyle(
                        color: _selectedIndex == 1 ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () => _onButtonPressed(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == 2 ? Colors.green : Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Закрытые",
                      style: TextStyle(
                        color: _selectedIndex == 2 ? Colors.white : Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),

              ],
            ),
            SizedBox(height: 16),
            GestureDetector(

              child: Container(
                  color: Colors.white,

                  padding: EdgeInsets.only(left: 16, right: 8, top: 15, bottom: 16),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                                text: TextSpan(
                                    text: "${ords.paymentMethod} ",
                                    style: TextStyle(
                                        fontFamily: "Open sans",
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black
                                    ),
                                    children: [
                                      TextSpan(
                                          text: "${amount} руб.",
                                          style: TextStyle(
                                              fontFamily: "Open sans",
                                              fontSize: 18,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.green
                                          )
                                      )
                                    ]
                                )
                            ),
                            Text("№${ords.Id}", style: TextStyle(
                                fontFamily: "Open sans",
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: Color.fromRGBO(184, 184, 184, 1)
                            ),)
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 247, 236, 1),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                          child: Text("Готовится", style: TextStyle(
                              color: Color.fromRGBO(242, 171, 88, 1)
                          ),),
                        ),
                      ),
                      SizedBox(height: 8), // Расстояние между палочкой и предыдущим контейнером
                      Container(
                        height: 1,
                        color: Color.fromRGBO(217, 217, 217, 1),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: Column(

                                        children: [
                                          Image.asset("assets/icons/IconMapsA.png"),
                                          Container(
                                            width: 2,
                                            height: 22,
                                            color: Color.fromRGBO(231, 231, 231, 1.0),
                                          )
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Улица Дружбы 19", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            fontFamily: "Open sans"
                                        ),),
                                        Text("Кемерово, Россия", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            fontFamily: "Open sans",
                                            color: Color.fromRGBO(184, 184, 184, 1)
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 12),
                                      child: Image.asset("assets/icons/IconMapsB.png"),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("просп. Ленина 130", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            fontFamily: "Open sans"
                                        ),),
                                        Text("Кемерово, Россия", style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 14,
                                            fontFamily: "Open sans",
                                            color: Color.fromRGBO(184, 184, 184, 1)
                                        ),)
                                      ],
                                    )
                                  ],
                                ),

                              ],

                            ),
                          ),
                          Image.asset("assets/icons/map.png")
                        ],
                      ),

                    ],
                  )
              ),
              onTap: () {

                OrderDetail.status = "Текущий";
                OrderDetail.ord = ords;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetail()));

              },
            )
          ],
        ),
      )

    );
  }

}




