// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String authorName;
  final String title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    super.key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  });

  @override
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  bool _isFavorited = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            CircleImage(
              imageProvider: widget.imageProvider,
              imageRadius: 28,
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.authorName,
                  style: FooderlichTheme.lightTextTheme.displayMedium,
                ),
                Text(
                  widget.title,
                  style: FooderlichTheme.lightTextTheme.displaySmall,
                )
              ],
            ),
          ]),
          IconButton(
            icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          ),
        ],
      ),
    );
  }
}
