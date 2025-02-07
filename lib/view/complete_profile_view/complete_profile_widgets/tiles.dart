import 'package:flutter/material.dart';

class Tiles extends StatefulWidget {
  final String tileTitle;
  final Widget trailing;

  const Tiles({super.key, required this.tileTitle, required this.trailing});

  @override
  State<Tiles> createState() => _TilesState();
}

class _TilesState extends State<Tiles> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.tileTitle),
      trailing: widget.trailing,
    );
  }
}