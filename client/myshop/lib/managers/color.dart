import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorManagerProvider = Provider((ref) => ColorManager());

class ColorManager {
  final Color primaryColor = Colors.blue;
}
