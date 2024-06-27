import 'package:bloc_data/bloc/data_bloc.dart';
import 'package:bloc_data/view/widgets/content_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataScreen extends StatelessWidget {
  const DataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue.shade700,
        title: const Text(
          'Random String Generator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Container(
        // Create a gradient background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade700, Colors.blue.shade200],
          ),
        ),
        // Use BlocBuilder to rebuild UI based on DataBloc state changes
        child: BlocBuilder<DataBloc, DataState>(
          builder: (context, state) {
            return Center(
              child: Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: _buildContent(state),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade700,
        // Add FetchDataEvent to the bloc when pressed
        onPressed: () => context.read<DataBloc>().add(FetchDataEvent()),
        label: const Text(
          "Generate",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        icon: const Icon(Icons.refresh, color: Colors.white),
      ),
    );
  }

// Helper method to build content based on the current state
  Widget _buildContent(DataState state) {
    if (state is DataInitial) {
      return const ContentDisplay(
        icon: Icons.touch_app,
        message: 'Press the button to generate a random string',
      );
    } else if (state is DataLoading) {
      return const CircularProgressIndicator();
    } else if (state is DataLoaded) {
      return ContentDisplay(
        icon: Icons.check_circle,
        message: 'Random String',
        content: state.randomString,
      );
    } else if (state is DataError) {
      return const ContentDisplay(
        icon: Icons.error,
        message: 'An error occurred. Please try again.',
        color: Colors.red,
      );
    }
    return Container();
  }
}
