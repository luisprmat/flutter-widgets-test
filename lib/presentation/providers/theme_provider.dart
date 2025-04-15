import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Inmutable color list
final colorListProvider = Provider<List<Color>>((ref) => colorList);

// A simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

// A simple int
final selectedColorProvider = StateProvider<int>((ref) => 0);

