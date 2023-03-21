import 'package:flutter/material.dart';

import 'config.dart';

abstract class AppTextStyles {
  static const homeAppBar = TextStyle(fontSize: 14, color: AppColors.grey);
  static const homeYourNotesTitle =
      TextStyle(fontSize: 66, color: AppColors.white);
  static const homeYourNotesCount =
      TextStyle(fontSize: 44, color: AppColors.grey);
  static const homeCategoryItem = TextStyle(fontSize: 21);
  static const homeNoteItemCount =
      TextStyle(fontSize: 14, color: AppColors.grey);
  static const homeNoteItemTitle =
      TextStyle(fontSize: 30, color: AppColors.white);
  static const homeNoteItemContent = TextStyle(
    fontSize: 15,
    color: AppColors.grey,
    fontWeight: FontWeight.w500,
    height: 1.5,
  );

  static const noteAppBar = TextStyle(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  static const noteDetails = TextStyle(fontSize: 15, color: AppColors.grey);
  static const noteTitle = TextStyle(fontSize: 44, color: AppColors.black);
  static const noteContent = TextStyle(
    fontSize: 15,
    color: AppColors.grey,
    height: 1.5,
  );
  static const noteTodoHeader = TextStyle(
    fontSize: 15,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );
  static const noteTodoDescription = TextStyle(fontSize: 15);
}
