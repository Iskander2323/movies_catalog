import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_catalog/components/bloc/movie_catalog_bloc.dart';

class MovieCardPage extends StatefulWidget {
  // const MovieCardPage({super.key, required this.id});
  const MovieCardPage({super.key});

  // final int id;

  @override
  State<MovieCardPage> createState() => _MovieCardPageState();
}

class _MovieCardPageState extends State<MovieCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie page'),
      ),
      body: BlocBuilder<MoviesCatalogBloc, MoviesCatalogState>(
          builder: (context, state) {
        // final movie = state.allMovies.firstWhere((ele) => ele.id == widget.id);
        return LayoutBuilder(builder: (context, constraints) {
          final List<String> items = ['Смотрю', 'Просмотрено', 'В планах'];

          // Выбранное значение
          String? selectedItem;
          return Container(
            padding: EdgeInsets.all(10),
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            child: Column(
              children: [
                Container(
                  width: constraints.maxWidth * 0.6,
                  height: constraints.maxHeight * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                Text('Movie name'),
                DropdownButton<String>(
                  value: selectedItem, // Текущее выбранное значение
                  hint: const Text('Выберите статус'), // Подсказка
                  items: items.map((item) {
                    return DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      selectedItem = newValue; // Обновляем выбранное значение
                    });
                  },
                  // Дополнительно: Стилизация
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  underline: Container(
                    height: 2,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        });
      }),
    );
  }
}
