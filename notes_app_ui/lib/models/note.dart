import 'models.dart';

class Note {
  Note({
    required this.title,
    this.content = '',
    required this.category,
    required this.date,
    this.todos = const [],
  });

  final String title;
  final String content;
  final Category category;
  final DateTime date;
  final List<Todo> todos;
}

final notes = [
  Note(
    title: 'daily tasks',
    category: Category(name: 'personal'),
    date: DateTime.parse("20221202"),
    todos: [
      Todo(description: 'to pick up a package'),
      Todo(description: 'a session with a therapist')
    ],
  ),
  Note(
    title: 'balance',
    content:
        'when a design is unbalanced, the individual elements dominate the rest',
    category: Category(name: 'personal'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'wishlist',
    content:
        'here is a collection of your links to your favorite products and gadgets',
    category: Category(name: 'personal'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'call summary',
    content:
        'several new features need to be implemented in the existing project',
    category: Category(name: 'work'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'what to discuss',
    content:
        'we have started the analytics phase, we need test access to the app to try out the existing features.\n\nwe need to coordinate a call with management to undestand how soon we can start wireframes\n\nask the client to collect positive and negative references that will help in the work on the concept.',
    category: Category(name: 'work'),
    date: DateTime.parse("20221118"),
    todos: [
      Todo(description: 'request test access'),
      Todo(description: 'send an invoice for payment'),
      Todo(description: 'update the designer on new features'),
    ],
  ),
  Note(
    title: 'about project',
    content:
        'making a mobile application for a major bank in Canada, the main idea is great.',
    category: Category(name: 'work'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'eget mauris',
    content:
        'feugiat vivamus at augue eget arcu dictum varius duis at consectetur lorem donec massa sapien faucibus et molestie ac feugiat',
    category: Category(name: 'home'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'sollicitudin aliquam',
    content:
        'fermentum odio eu feugiat pretium nibh ipsum consequat nisl vel pretium lectus quam id leo in vitae turpis massa sed',
    category: Category(name: 'home'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'dignissim convallis',
    content:
        'consectetur adipiscing elit ut aliquam purus sit amet luctus venenatis lectus magna fringilla urna porttitor rhoncus dolor purus non enim',
    category: Category(name: 'study'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'lectus arcu',
    content:
        'sem integer vitae justo eget magna fermentum iaculis eu non diam phasellus vestibulum lorem sed risus ultricies tristique nulla aliquet',
    category: Category(name: 'study'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'et odio',
    content:
        'mi proin sed libero enim sed faucibus turpis in eu mi bibendum neque egestas congue quisque egestas diam in arcu',
    category: Category(name: 'books'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'turpis egestas',
    content:
        'varius sit amet mattis vulputate enim nulla aliquet porttitor lacus luctus accumsan tortor posuere ac ut consequat semper viverra nam',
    category: Category(name: 'books'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'non blandit',
    content:
        'pellentesque sit amet porttitor eget dolor morbi non arcu risus quis varius quam quisque id diam vel quam elementum pulvinar',
    category: Category(name: 'articles'),
    date: DateTime.parse("20221202"),
  ),
  Note(
    title: 'semper risus',
    content:
        'scelerisque mauris pellentesque pulvinar pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas maecenas pharetra convallis',
    category: Category(name: 'lists'),
    date: DateTime.parse("20221202"),
  ),
];
