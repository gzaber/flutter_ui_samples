class Lamp {
  Lamp({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
  });

  final String name;
  final String description;
  final String imageUrl;
  final String price;

  static String headerLampUrl =
      'https://images.unsplash.com/photo-1517991104123-1d56a6e81ed9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2070&q=80';

  static List<Lamp> lamps = [
    Lamp(
      name: 'Dome Table Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1569935603402-9253538d2d6d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      price: '\$1,800',
    ),
    Lamp(
      name: 'Copper Table Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1542728928-1413d1894ed1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      price: '\$675',
    ),
    Lamp(
      name: 'Black Floor Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1571898225625-bce97766f62e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: '\$835',
    ),
    Lamp(
      name: 'Classic Table Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1601011677167-21a7d77fe101?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: '\$2,450',
    ),
    Lamp(
      name: 'Wooden Table Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1580130281320-0ef0754f2bf7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2080&q=80',
      price: '\$350',
    ),
    Lamp(
      name: 'Modern Table Lamp',
      description: 'description',
      imageUrl:
          'https://images.unsplash.com/photo-1579656618142-5192f72e2d3d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: '\$990',
    ),
  ];
}
