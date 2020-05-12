import 'package:flutter/material.dart';

import '../../bloc/users_bloc.dart';
import '../../data/models/user.dart';
import '../widgets/feed.dart';
import '../widgets/loading.dart';
import '../widgets/stories.dart';

class HomeScreen extends StatefulWidget {
  final UsersBloc bloc;

  HomeScreen({@required this.bloc});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    widget.bloc.fetchUsers();
  }

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

  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }

  Widget _buildStories() {
    return Container(
      height: 120.0,
      color: Colors.grey.shade200,
      child: StreamBuilder(
        stream: widget.bloc.users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final users = snapshot.data;
            return Stories(users: users);
          }
          return Loading();
        },
      ),
    );
  }

  Widget _buildFeed() {
    return Expanded(
      child: StreamBuilder(
        stream: widget.bloc.users,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final List<User> users = snapshot.data;
            return Feed(users: users);
          }
          return Loading();
        },
      ),
    );
  }
}
