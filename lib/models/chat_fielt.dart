import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class ChatField {
  final String hintText;                     // Placeholder text
  final Color borderColor;                   // Outline color
  final RxBool isListening;                  // Mic active?
  final TextEditingController controller;    // Text field controller

  ChatField({
    required this.hintText,
    required this.borderColor,
    required this.isListening,
    required this.controller,
  });
}
