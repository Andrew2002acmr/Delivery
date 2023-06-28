

import 'package:delivery/datasourse/Product.dart';

class Order {
  int Id;
  List<Product> products;
  int discount;
  String paymentMethod;

  Order({
    required this.Id,
    required this.products,
    required this.discount,
    required this.paymentMethod,
  });
}

