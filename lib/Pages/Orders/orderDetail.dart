

import 'package:delivery/datasourse/Order.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  static Order ord = Order(
      Id: 0,
      products: [],
      discount: 0,
      paymentMethod: ""
  );

  static String status = "Новый";

  @override
  State<StatefulWidget> createState() => _orderDetailState();

}

class _orderDetailState extends State<OrderDetail> {

  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _houseNumberController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  final TextEditingController _prodListController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _levelController.text = "20";
    _houseNumberController.text = "215";
    _nameController.text = "Иванов Иван Иванович";
    _phoneController.text = "89999999999";
    _commentController.text = "Подойти к КПП, спросить Валеру";

    String listProd = "";

    for(int i=0; i<OrderDetail.ord.products.length; i++){

      listProd += "${OrderDetail.ord.products[i].name} x ${OrderDetail.ord.products[i].count}";
      if(i != OrderDetail.ord.products.length - 1){
        listProd += "\n";
      }
    }

    _prodListController.text = listProd;
  }

  @override
  Widget build(BuildContext context) {

    // Order order = Orders.listOrders[index];

    Order order = OrderDetail.ord;

    double amount = 0;

    for(int i=0;i<order.products.length;i++){
      amount += order.products[i].price;
    }
    amount = amount + amount * (order.discount / 100);

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 250,
        leading: Padding(
          padding: EdgeInsets.only(left: 25, top: 16),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Text("Заказ № ${order.Id}", style: TextStyle(
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black
              ),),
            ],
          )
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 22),
            child: Align(
              alignment: Alignment.centerRight,
              child: Text("${OrderDetail.status}", style: TextStyle(
                  fontFamily: "Open Sans",
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                  color: Color.fromRGBO(184, 184, 184, 1)
              ),),
            ),
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(231, 231, 231, 1.0),
      body: Container(
          color: Colors.white,

          padding: EdgeInsets.only(left: 16, right: 8, top: 15, bottom: 16),
          margin: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            text: "${order.paymentMethod} ",
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
                margin: EdgeInsets.only(bottom: 8, top: 8),
                child: Row(
                  children: [
                    Expanded(
                        child:Container(
                          margin: EdgeInsets.only(right: 16),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Этаж", style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Open sans",
                                  color: Color.fromRGBO(184, 184, 184, 1)
                              ),),
                              Text("${20}", style: TextStyle(
                                fontFamily: "Open sans",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                              ),),
                              Container(
                                height: 1,
                                color: Color.fromRGBO(184, 184, 184, 1),
                              )
                            ],
                          ),
                        )
                    ),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Квартира (Офис)",  style: TextStyle(
                                fontSize: 14,
                                fontFamily: "Open sans",
                                color: Color.fromRGBO(184, 184, 184, 1)
                            ),),
                            Text("${215}", style: TextStyle(
                                fontFamily: "Open sans",
                                fontSize: 18,
                                fontWeight: FontWeight.w500
                            ),),
                            Container(
                              height: 1,
                              color: Color.fromRGBO(184, 184, 184, 1),
                            )
                          ],
                        )
                    ),

                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Получатель",  style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Open sans",
                          color: Color.fromRGBO(184, 184, 184, 1)
                      ),),
                      Text("Иванов Иван Иванович", style: TextStyle(
                          fontFamily: "Open sans",
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Container(
                        height: 1,
                        color: Color.fromRGBO(184, 184, 184, 1),
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Телефон",  style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Open sans",
                          color: Color.fromRGBO(184, 184, 184, 1)
                      ),),
                      Text("89999999999", style: TextStyle(
                          fontFamily: "Open sans",
                          fontSize: 18,
                          fontWeight: FontWeight.w500
                      ),),
                      Container(
                        height: 1,
                        color: Color.fromRGBO(184, 184, 184, 1),
                      )
                    ],
                  )
              ),
              Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Комментарий",  style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Open sans",
                          color: Color.fromRGBO(184, 184, 184, 1)
                      ),),
                      CupertinoTextField(
                        readOnly: true,
                        textAlignVertical: TextAlignVertical.top,
                        controller: _commentController,
                        padding: EdgeInsets.all(0),
                        maxLines: null,
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Прозрачный фон для текстового поля
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color.fromRGBO(184, 184, 184, 1),
                      )
                    ],
                  )
              ),
              Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Заказ",  style: TextStyle(
                          fontSize: 14,
                          fontFamily: "Open sans",
                          color: Color.fromRGBO(184, 184, 184, 1)
                      ),),
                      CupertinoTextField(
                        readOnly: true,
                        textAlignVertical: TextAlignVertical.top,
                        padding: EdgeInsets.all(0),
                        controller: _prodListController,
                        maxLines: null,
                        decoration: BoxDecoration(
                          color: Colors.transparent, // Прозрачный фон для текстового поля
                        ),
                      ),
                      Container(
                        height: 1,
                        color: Color.fromRGBO(184, 184, 184, 1),
                      )
                    ],
                  )
              ),

            ],
          ),

      ),
      bottomSheet:  Container(
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
              // Обработка нажатия кнопки
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
      ),
    );

  }

}

