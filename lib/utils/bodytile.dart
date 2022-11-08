import 'package:flutter/material.dart';

class BodyTile extends StatelessWidget {
  BodyTile(
      {super.key,
      required this.name,
      required this.designation,
      required this.address});
  String name;
  String designation;
  String address;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(blurRadius: 10, color: Colors.grey)],
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      name,
                      textDirection: TextDirection.rtl,
                      maxLines: 2,
                      style: const TextStyle(fontSize: 16),
                    ),
                 
                    Text(
                      designation,
                      textDirection: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        address,
                        textDirection: TextDirection.rtl,
                        maxLines: 3,
                        style:
                            const TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
