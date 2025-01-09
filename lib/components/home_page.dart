import 'package:flutter/material.dart';
import 'package:movies_catalog/components/ui/grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            title: Text('MoviesCatalog'),
            backgroundColor: Colors.blueAccent,
            bottom: TabBar(
              tabs: [
                Text('Смотрю'),
                Text('Просмотрено'),
                Text('В планах'),
              ],
            ),
          ),
          body: TabBarView(children: [
            MoviesGridView(),
            Center(
              child: Text('Здесь фильмы которые ты посмотрел'),
            ),
            Center(
              child: Text('Здесь фильмы которые ты планируешь смотреть'),
            )
          ])),
    );
  }
}
