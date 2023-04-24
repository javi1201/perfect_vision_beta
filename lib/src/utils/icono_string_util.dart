import 'package:flutter/material.dart';

final _icons = <String, IconData>{
  'format_color_text_rounded': Icons.format_color_text_rounded,
  'visibility_outlined': Icons.visibility_outlined,
  'format_shapes_outlined': Icons.format_shapes_outlined,
  'playlist_add_check_circle_outlined':
      Icons.playlist_add_check_circle_outlined,
  'remove_red_eye_outlined': Icons.remove_red_eye_outlined,
  'book_online_sharp': Icons.book_online_sharp,
  'bakery_dining_outlined': Icons.bakery_dining_outlined
};

Icon getIcon(String nombreIcono) {
  return Icon(_icons[nombreIcono], color: Colors.blue);
}
