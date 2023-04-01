import 'package:flutter/material.dart';

import '../config/config.dart';
import '../models/models.dart';
import '../widgets/widgets.dart';

class NotePage extends StatelessWidget {
  const NotePage({
    super.key,
    required this.note,
  });

  final Note note;

  static Route route({required Note note}) {
    return MaterialPageRoute(
      builder: (_) => NotePage(note: note),
      settings: const RouteSettings(name: '/note'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            const _CustomAppBar(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const HorizontalLine(color: AppColors.black),
                    _Details(note: note),
                    _Title(title: note.title),
                    _Content(content: note.content),
                  ],
                ),
              ),
            ),
            note.todos.isEmpty ? const SizedBox() : _Todos(todos: note.todos),
          ],
        ),
      ),
    );
  }
}

_formatDate(DateTime date) {
  return '${date.day} / ${date.month} / ${date.year.toString().substring(date.year.toString().length - 2)}';
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
          SlideComponent(
            fromDirection: AxisDirection.left,
            child: IconButton(
              onPressed: () => Navigator.pop<void>(context),
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.black,
              ),
              splashRadius: 20,
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
            ),
          ),
          const SlideComponent(
            fromDirection: AxisDirection.right,
            child: Text(
              'delete',
              style: AppTextStyles.noteAppBar,
            ),
          ),
        ],
      ),
    );
  }
}

class _Details extends StatelessWidget {
  const _Details({
    required this.note,
  });

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, top: 20, right: 25, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SlideComponent(
            fromDirection: AxisDirection.left,
            child:
                Text(_formatDate(note.date), style: AppTextStyles.noteDetails),
          ),
          SlideComponent(
            fromDirection: AxisDirection.right,
            child: Text('#${note.category.name}',
                style: AppTextStyles.noteDetails),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return SlideComponent(
      fromDirection: AxisDirection.down,
      isFading: true,
      offsetRatio: 0.5,
      beginInterval: 0.7,
      duration: const Duration(milliseconds: 1400),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: TextEditingController(text: title),
          decoration: const InputDecoration(border: InputBorder.none),
          style: AppTextStyles.noteTitle,
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    required this.content,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return SlideComponent(
      fromDirection: AxisDirection.down,
      isFading: true,
      offsetRatio: 0.3,
      beginInterval: 0.7,
      duration: const Duration(milliseconds: 1800),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          controller: TextEditingController(text: content),
          maxLines: null,
          decoration: const InputDecoration(border: InputBorder.none),
          style: AppTextStyles.noteContent,
        ),
      ),
    );
  }
}

class _Todos extends StatelessWidget {
  const _Todos({
    Key? key,
    required this.todos,
  }) : super(key: key);

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HorizontalLine(color: AppColors.black),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const SlideComponent(
                isFading: true,
                fromDirection: AxisDirection.down,
                beginInterval: 0.5,
                child: Text(
                  'don\'t forget /',
                  style: AppTextStyles.noteTodoHeader,
                ),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                todos.length,
                (index) => SlideComponent(
                  isFading: true,
                  duration: Duration(milliseconds: 1000 + (index + 1) * 100),
                  beginInterval: 0.5,
                  fromDirection: AxisDirection.down,
                  child: _TodoItem(todo: todos[index]),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}

class _TodoItem extends StatefulWidget {
  const _TodoItem({
    Key? key,
    required this.todo,
  }) : super(key: key);

  final Todo todo;

  @override
  State<_TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<_TodoItem> {
  late bool isChecked;

  @override
  void initState() {
    isChecked = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: GestureDetector(
        onTap: () => setState(() {
          isChecked = !isChecked;
        }),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: isChecked ? AppColors.orange : AppColors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    color: isChecked ? AppColors.orange : AppColors.grey,
                    width: 1.2),
              ),
              child: isChecked
                  ? const Icon(
                      Icons.check,
                      size: 15,
                    )
                  : null,
            ),
            Text(
              widget.todo.description,
              style: AppTextStyles.noteTodoDescription.copyWith(
                decoration: isChecked
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                color: isChecked ? AppColors.grey : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
