import 'package:flutter/material.dart';

import '../../data/models/user.dart';
import '../../data/providers/memory_provider.dart';
import '../../data/repositories/users_repository.dart';

class HomeScreen extends StatelessWidget {
  final repository = UsersRepository();

  final _bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Inicio'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add_box),
      title: Text('Adicionar'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.search),
      title: Text('Procurar'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.camera),
          onPressed: () {},
        ),
        title: Text(
          'Fotinhas',
          style: TextStyle(
            fontSize: 22.0,
            fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          _buildStories(),
          _buildFeed(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 36.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: _bottomBarItems,
      ),
    );
  }

  Widget _buildStories() {
    return Container(
      height: 120.0,
      color: Colors.grey.shade200,
      child: FutureBuilder(
        future: repository.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> users = snapshot.data;
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
                        radius: 35.0,
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
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildFeed() {
    final users = MemoryProvider().getUsers();
    return Expanded(
      child: ListView.builder(
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
                        'https://picsum.photos/150',
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Text(
                      user.username,
                      style: TextStyle(
                        fontSize: 18.0,
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
      ),
    );
  }
}
