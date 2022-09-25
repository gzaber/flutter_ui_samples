import 'package:flutter/material.dart';

import 'package:lamp_shop_app_ui/models/models.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({
    Key? key,
    required this.lamp,
  }) : super(key: key);

  final Lamp lamp;

  static Route route({required Lamp lamp}) {
    return MaterialPageRoute(
      builder: (context) => DetailsPage(lamp: lamp),
      settings: const RouteSettings(name: '/details'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.network(
            lamp.imageUrl,
            width: width,
            height: height / 2,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
