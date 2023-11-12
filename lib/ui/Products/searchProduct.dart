import 'package:flutter/material.dart';
class ProductSearch extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();
  final Function(String) onSearch;

  ProductSearch({super.key, required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Buscar Productos'),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            onSearch(_searchController.text);
          },
        ),
      ],
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              hintText: 'Buscar productos...',
              prefixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) {
              onSearch(value);
            },
          ),
        ),
      ),
    );
  }
}
