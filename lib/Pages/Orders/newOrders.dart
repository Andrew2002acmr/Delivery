import 'package:delivery/datasourse/Order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:delivery/Pages/Orders/orderDetail.dart';
import 'package:delivery/main.dart';

class NewOrders extends StatefulWidget {



  @override
  State<StatefulWidget> createState() => _newOrdersState();

}


class _newOrdersState extends State<NewOrders> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 200,
        leading: Padding(
          padding: EdgeInsets.only(left: 25, top: 16),
          child: Text("Новые заказы - ${2}", style: TextStyle(
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
        padding: EdgeInsets.only(top: 16),
        color: Color.fromRGBO(231, 231, 231, 1.0),
        child: ListView.builder(
            itemCount: OrdersList.listOrders.length,
            itemBuilder: (context, index) {
              Order order = OrdersList.listOrders[index];
              double amount = 0;

              for(int i=0;i<order.products.length;i++){
                amount += order.products[i].price;
              }
              amount = amount + amount * (order.discount / 100);

              return GestureDetector(
                child: Container(
                    color: Colors.white,

                    padding: EdgeInsets.only(left: 16, right: 8, top: 15, bottom: 16),
                    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "${order.paymentMethod}",
                                      style: TextStyle(
                                          fontFamily: "Open sans",
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black
                                      ),
                                      children: [
                                        TextSpan(
                                            text: " ${amount.toStringAsFixed(2)} руб.",
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
                              Text("№${order.Id}", style: TextStyle(
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
                        Container(
                          margin: EdgeInsets.only(top: 16),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // padding: EdgeInsets.symmetric(horizontal: 16),
                          child: SizedBox(
                            width: double.infinity,
                            child: TextButton(
                              onPressed: () {


                              },
                              child: Text(
                                'Принять заказ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                ),
                onTap: () {
                  OrderDetail.ord = order;
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderDetail()));
                },
              );
            }
        ),
      ),
    );
  }

}


