import 'package:flutter/material.dart';

class PorgramInfoPage extends StatefulWidget {
  String name;
  String link;
  String info;
  PorgramInfoPage({
    Key? key,
    required this.name,
    required this.link,
    required this.info,
  }) : super(key: key);

  @override
  State<PorgramInfoPage> createState() => _PorgramInfoPageState();
}

class _PorgramInfoPageState extends State<PorgramInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.link),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(80),
                    bottomRight: Radius.circular(80)),
                color: Colors.black.withOpacity(0.5),
              ),
              height: 400,
              width: double.infinity,
              alignment: Alignment.center,
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.info,
                style: TextStyle(
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.name.toUpperCase(),
              style: TextStyle(
                  fontSize: 32,
                  color: Colors.black.withOpacity(0.3),
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
