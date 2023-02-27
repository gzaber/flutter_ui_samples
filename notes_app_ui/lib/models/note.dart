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
];
