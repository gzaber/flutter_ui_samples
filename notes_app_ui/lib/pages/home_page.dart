import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/config.dart';
import '../models/models.dart';
import '../providers/providers.dart';
import '../widgets/widgets.dart';
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
                    HorizontalLine(color: AppColors.grey),
                    _YourNotes(),
                    _CategoryList(),
                    HorizontalLine(color: AppColors.white),
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
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                text: const TextSpan(
                  text: 'morning, ',
                  style: AppTextStyles.homeAppBar,
                  children: [
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
              color: AppColors.white,
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

class _YourNotes extends StatelessWidget {
  const _YourNotes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 15, right: 25, bottom: 25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Text(
            'your\n   notes',
            style: AppTextStyles.homeYourNotesTitle,
          ),
          Text(
            '/${notes.length}',
            style: AppTextStyles.homeYourNotesCount,
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
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 30),
          itemCount: categories.length,
          itemBuilder: (context, index) =>
              _CategoryItem(category: categories[index]),
        ),
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
          color: categoryName == category.name
              ? AppColors.orange
              : AppColors.black,
          border: Border.all(
            color: categoryName == category.name
                ? AppColors.orange
                : AppColors.white,
          ),
        ),
        child: Center(
          child: Text(
            '#${category.name}',
            style: AppTextStyles.homeCategoryItem.copyWith(
              color: categoryName == category.name
                  ? AppColors.black
                  : AppColors.white,
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
          const HorizontalLine(color: AppColors.white),
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
              style: AppTextStyles.homeNoteItemCount,
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeNoteItemTitle,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _getNoteContent(note),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.homeNoteItemContent,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            const SizedBox(width: 20),
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
