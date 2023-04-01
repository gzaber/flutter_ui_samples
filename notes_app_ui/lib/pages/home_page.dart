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
                    _YourNotes(),
                    _CategoryList(),
                    HorizontalLine(color: AppColors.grey),
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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const SlideComponent(
                        fromDirection: AxisDirection.left,
                        offsetRatio: 5,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile_photo.jpg'),
                          radius: 16,
                        ),
                      ),
                      const SizedBox(width: 10),
                      SlideComponent(
                        fromDirection: AxisDirection.left,
                        offsetRatio: 1,
                        child: RichText(
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
                      ),
                    ],
                  ),
                  SlideComponent(
                    fromDirection: AxisDirection.right,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: AppColors.white,
                      ),
                      splashRadius: 20,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const HorizontalLine(color: AppColors.grey),
      ],
    );
  }
}

class _YourNotes extends StatelessWidget {
  const _YourNotes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SlideComponent(
                fromDirection: AxisDirection.left,
                child: Text(
                  'your',
                  style: AppTextStyles.homeYourNotesTitle,
                ),
              ),
              SlideComponent(
                fromDirection: AxisDirection.left,
                child: Text(
                  '   notes',
                  style: AppTextStyles.homeYourNotesTitle,
                ),
              ),
            ],
          ),
          SlideComponent(
            fromDirection: AxisDirection.right,
            child: Text(
              '/${notes.length}',
              style: AppTextStyles.homeYourNotesCount,
            ),
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
      padding: const EdgeInsets.only(bottom: 35),
      child: SizedBox(
        height: 45,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 30),
          itemCount: categories.length,
          itemBuilder: (context, index) => SlideComponent(
            fromDirection: AxisDirection.right,
            offsetRatio: index + 1,
            child: _CategoryItem(category: categories[index]),
          ),
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
      itemBuilder: (context, index) {
        if (categoryName.isEmpty) {
          return _NoteItem(
            index: index,
            note: currentNotes[index],
            filtered: false,
          );
        } else {
          return SlideComponent(
            fromDirection: AxisDirection.right,
            duration: Duration(milliseconds: 600 + (index + 1) * 200),
            child: _NoteItem(
              index: index,
              note: currentNotes[index],
              filtered: true,
            ),
          );
        }
      },
      separatorBuilder: (context, index) {
        return HorizontalLine(
          color: AppColors.grey,
          duration: Duration(milliseconds: 1000 + index * 200),
        );
      },
    );
  }
}

class _NoteItem extends StatelessWidget {
  const _NoteItem({
    Key? key,
    required this.index,
    required this.note,
    required this.filtered,
  }) : super(key: key);

  final int index;
  final Note note;
  final bool filtered;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, NotePage.route(note: note)),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  filtered
                      ? _NoteItemNumberWithTitle(
                          index: index, title: note.title)
                      : SlideComponent(
                          fromDirection: index.isEven
                              ? AxisDirection.left
                              : AxisDirection.right,
                          offsetRatio: 2,
                          child: _NoteItemNumberWithTitle(
                              index: index, title: note.title),
                        ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 35),
                      Expanded(
                        child: filtered
                            ? _NoteItemContent(note: note)
                            : SlideComponent(
                                fromDirection: index.isEven
                                    ? AxisDirection.left
                                    : AxisDirection.right,
                                offsetRatio: 1,
                                child: _NoteItemContent(note: note),
                              ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 30),
            filtered
                ? const Icon(
                    Icons.north_east,
                    size: 15,
                    color: AppColors.white,
                  )
                : const SlideComponent(
                    fromDirection: AxisDirection.right,
                    offsetRatio: 5,
                    child: Icon(
                      Icons.north_east,
                      size: 15,
                      color: AppColors.white,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class _NoteItemNumberWithTitle extends StatelessWidget {
  const _NoteItemNumberWithTitle({
    Key? key,
    required this.index,
    required this.title,
  }) : super(key: key);

  final int index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 35,
          child: Text(
            index < 9 ? '0${index + 1} /' : '${index + 1} /',
            style: AppTextStyles.homeNoteItemCount,
          ),
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.homeNoteItemTitle,
          ),
        ),
      ],
    );
  }
}

class _NoteItemContent extends StatelessWidget {
  const _NoteItemContent({required this.note});

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Text(
      _getNoteContent(note),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.homeNoteItemContent,
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
