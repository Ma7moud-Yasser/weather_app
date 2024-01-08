import 'package:chat_app/view/searchScreen.dart';
import 'package:flutter/material.dart';

Widget searchComponent(BuildContext context) => IconButton(
    onPressed: () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SearchScreen(),
          ));
    },
    icon: const Icon(
      Icons.search,
      color: Colors.black,
      size: 35,
    ));
