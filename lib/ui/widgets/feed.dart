import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class Feed extends StatelessWidget {
  final List<User> users;
  final double textSize;

  Feed({
    @required this.users,
    this.textSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users.elementAt(index);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      user.avatar,
                    ),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    user.username,
                    style: TextStyle(
                      fontSize: textSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Image(
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              image: NetworkImage('https://picsum.photos/300'),
            ),
          ],
        );
      },
    );
  }
}
