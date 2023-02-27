import 'package:flutter/material.dart';

import '../config/config.dart';
import '../models/models.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _CustomAppBar(),
              _HorizontalLine(width: width),
              const _YourNotes(),
              const _CategoryList(),
              _HorizontalLine(width: width),
              _NoteList(width: width),
            ],
          ),
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
      padding: const EdgeInsets.only(top: 15, left: 30, right: 25, bottom: 15),
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
          )
        ],
      ),
    );
  }
}

class _HorizontalLine extends StatelessWidget {
  const _HorizontalLine({
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width - 60,
      height: 1.5,
      color: AppColors.grey,
      margin: const EdgeInsets.symmetric(horizontal: 30),
    );
  }
}

class _YourNotes extends StatelessWidget {
  const _YourNotes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
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
            '/14',
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
    return Container(
      height: 45,
      margin: const EdgeInsets.only(bottom: 30),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: AppColors.white),
      ),
      child: Center(
        child: Text(
          '#${category.name}',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white, fontWeight: FontWeight.normal),
        ),
      ),
    );
  }
}

class _NoteList extends StatelessWidget {
  const _NoteList({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: notes.length,
      itemBuilder: (context, index) =>
          _NoteItem(index: index, note: notes[index]),
      separatorBuilder: (context, index) => _HorizontalLine(width: width),
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
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 30, right: 15),
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(color: AppColors.white),
                ),
                Text(
                  note.content,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.grey),
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
          ),
        ],
      ),
    );
  }
}
