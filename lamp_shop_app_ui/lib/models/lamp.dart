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
      name: 'Orange Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1562595995-58c7ec2da131?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      price: '\$1,800',
    ),
    Lamp(
      name: 'White Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1455792244736-3ed96c3d7f7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
      price: '\$675',
    ),
    Lamp(
      name: 'Modern Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1636649083511-27232b873c7e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=739&q=80',
      price: '\$835',
    ),
    Lamp(
      name: 'Narrow Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1619873770721-135be5830fee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=697&q=80',
      price: '\$350',
    ),
    Lamp(
      name: 'Classic Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1645074511406-5e2872367e54?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=743&q=80',
      price: '\$990',
    ),
    Lamp(
      name: 'Elegant Table Lamp',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      imageUrl:
          'https://images.unsplash.com/photo-1574830232644-b822346c05a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      price: '\$2,450',
    ),
  ];
}
