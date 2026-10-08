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

  void _clearSearch() {
    _searchController.clear();
    widget.onSearch('');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final hasText = _searchController.text.isNotEmpty;

    return Form(
      key: _formKey,
      child: TextFormField(
        controller: _searchController,
        textInputAction: TextInputAction.search,
        onChanged: (_) {
          setState(() {});
        },
        decoration: InputDecoration(
          hintText: 'Search movies...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (hasText)
                IconButton(
                  icon: const Icon(Icons.clear),
                  tooltip: 'Clear search',
                  onPressed: _clearSearch,
                ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Search',
                onPressed: _submitSearch,
              ),
            ],
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return null;
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