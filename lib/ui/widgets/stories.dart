import 'package:flutter/material.dart';

import '../../data/models/user.dart';

class Stories extends StatelessWidget {
  final List<User> users;
  final double avatarSize;
  final Color color;

  Stories({
    @required this.users,
    this.avatarSize = 35.0,
    this.color = Colors.black87,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users.elementAt(index);
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              CircleAvatar(
                radius: avatarSize,
                backgroundImage: NetworkImage(
                  user.avatar,
                ),
              ),
              Text(
                user.username,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
