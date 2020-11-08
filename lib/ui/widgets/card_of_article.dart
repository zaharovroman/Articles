import 'package:flutter/material.dart';

class CardOfArticle extends StatelessWidget {
  final _title;
  final _description;
  CardOfArticle(this._title, this._description);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Column(
            children: [
              Row(
                children: [Text(_title)],
              ),
              Row(
                children: [Text(_description)],
              )
            ],
          ),
        ),
      ),
    );
  }
}
