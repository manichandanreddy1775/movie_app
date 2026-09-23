import 'package:flutter/material.dart';

class MovieSearchForm extends StatefulWidget {
  final ValueChanged<String> onSearch;

  const MovieSearchForm({
    super.key,
    required this.onSearch,
  });

  @override
  State<MovieSearchForm> createState() => _MovieSearchFormState();
}

class _MovieSearchFormState extends State<MovieSearchForm> {
  final _formKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _submitSearch() {
    if (_formKey.currentState!.validate()) {
      widget.onSearch(_searchController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: 'Search movies...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: _submitSearch,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Please enter a movie name';
          }

          if (value.trim().length < 2) {
            return 'Enter at least 2 characters';
          }

          return null;
        },
        onFieldSubmitted: (_) => _submitSearch(),
      ),
    );
  }
}