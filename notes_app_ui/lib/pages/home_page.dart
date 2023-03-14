import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import 'pages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            const _CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    _HorizontalLine(color: AppColors.grey),
                    SizedBox(height: 20),
                    _YourNotes(),
                    SizedBox(height: 40),
                    _CategoryList(),
                    SizedBox(height: 40),
                    _HorizontalLine(color: AppColors.white),
                    _NoteList(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
                radius: 16,
              ),
              const SizedBox(width: 10),
              RichText(
                text: TextSpan(
                  text: 'morning, ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.grey),
                  children: const [
                    TextSpan(
                      text: 'Justin',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            splashRadius: 20,
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          )
        ],
      ),
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  const _HorizontalLine({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: color,
      margin: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}

class _YourNotes extends StatelessWidget {
  const _YourNotes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            'your\n   notes',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: AppColors.white, fontSize: 66),
          ),
          Text(
            '/${notes.length}',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: AppColors.grey),
          ),
        ],
      ),
    );
  }
}

class _CategoryList extends StatelessWidget {
  const _CategoryList();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 30),
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            _CategoryItem(category: categories[index]),
      ),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  const _CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    final categoryName = context
        .select<CategoryProvider, String>((category) => category.categoryName);

    return GestureDetector(
      onTap: () {
        Provider.of<CategoryProvider>(context, listen: false).update(category);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        margin: const EdgeInsets.only(right: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: categoryName == category.name ? AppColors.orange : null,
          border: Border.all(
            color: categoryName == category.name
                ? AppColors.orange
                : AppColors.white,
          ),
        ),
        child: Center(
          child: Text(
            '#${category.name}',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: categoryName == category.name
                      ? AppColors.black
                      : AppColors.white,
                  fontWeight: FontWeight.normal,
                ),
          ),
        ),
      ),
    );
  }
}

class _NoteList extends StatelessWidget {
  const _NoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryName = context
        .select<CategoryProvider, String>((category) => category.categoryName);

    List<Note> currentNotes = [];
    if (categoryName.isEmpty) {
      currentNotes = notes;
    } else {
      currentNotes =
          notes.where((note) => note.category.name == categoryName).toList();
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: currentNotes.length,
      itemBuilder: (context, index) =>
          _NoteItem(index: index, note: currentNotes[index]),
      separatorBuilder: (context, index) =>
          const _HorizontalLine(color: AppColors.white),
    );
  }
}

class _NoteItem extends StatelessWidget {
  const _NoteItem({
    Key? key,
    required this.index,
    required this.note,
  }) : super(key: key);

  final int index;
  final Note note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, NotePage.route(note: note)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '0${index + 1} /',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.grey),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColors.white),
                  ),
                  Text(
                    _getNoteContent(note),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.grey, height: 1.5),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.north_east),
              iconSize: 15,
              color: AppColors.white,
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ],
        ),
      ),
    );
  }
}

String _getNoteContent(Note note) {
  if (note.content.isNotEmpty) return note.content;
  if (note.todos.isNotEmpty) {
    String content = '';
    for (var todo in note.todos) {
      content += '•  ${todo.description}\n';
    }
    return content;
  }
  return '';
}
