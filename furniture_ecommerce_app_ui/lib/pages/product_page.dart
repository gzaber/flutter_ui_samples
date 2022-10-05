import 'package:flutter/material.dart';

import 'package:furniture_ecommerce_app_ui/models/models.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  static Route route({required Product product}) {
    return MaterialPageRoute(
      builder: (context) => ProductPage(product: product),
      settings: const RouteSettings(name: '/product'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('ProductPage')),
    );
  }
}
