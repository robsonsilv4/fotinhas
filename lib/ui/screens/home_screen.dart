import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final users = [
    'robson_silva',
    'zarathon_maia',
    'siqueira_junior',
    'mikael_matos',
    'emerson_vieira',
    'fco_gerlison',
  ];

  final _bottomBarItems = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      title: Text('Inicio'),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.add),
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
        items: _bottomBarItems,
      ),
    );
  }

  Widget _buildStories() {
    return Container(
      height: 120.0,
      color: Colors.grey.shade200,
      child: ListView.builder(
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
                    'https://picsum.photos/150',
                  ),
                ),
                Text(
                  user,
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
      ),
    );
  }

  Widget _buildFeed() {
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
                      user,
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
