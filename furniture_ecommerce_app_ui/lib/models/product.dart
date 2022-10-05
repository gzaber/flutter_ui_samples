class Product {
  const Product({
    required this.name,
    required this.manufacturer,
    required this.imageUrl,
    required this.isFavorite,
    required this.rating,
    required this.price,
  });

  final String name;
  final String manufacturer;
  final String imageUrl;
  final bool isFavorite;
  final double rating;
  final double price;

  static const List<Product> products = [
    Product(
      name: 'Arm chair',
      manufacturer: 'CB2 Exclusive',
      imageUrl:
          'https://images.unsplash.com/photo-1589584649628-b597067e07a3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      isFavorite: false,
      rating: 4.9,
      price: 120,
    ),
    Product(
      name: 'Griny chair',
      manufacturer: 'CB2 Exclusive',
      imageUrl:
          'https://images.unsplash.com/photo-1567538096630-e0c55bd6374c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
      isFavorite: true,
      rating: 4.7,
      price: 154,
    ),
    Product(
      name: 'Luxary chair',
      manufacturer: 'CB2 Exclusive',
      imageUrl:
          'https://images.unsplash.com/photo-1601366533287-5ee4c763ae4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
      isFavorite: false,
      rating: 4.8,
      price: 180,
    ),
    Product(
      name: 'Padded chair',
      manufacturer: 'CB2 Exclusive',
      imageUrl:
          'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80',
      isFavorite: false,
      rating: 4.6,
      price: 122.56,
    ),
    Product(
      name: 'Wooden chair',
      manufacturer: 'CB2 Exclusive',
      imageUrl:
          'https://images.unsplash.com/photo-1617364852223-75f57e78dc96?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=666&q=80',
      isFavorite: false,
      rating: 4.7,
      price: 144.67,
    ),
  ];
}
