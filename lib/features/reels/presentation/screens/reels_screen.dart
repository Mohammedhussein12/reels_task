import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_provider.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_states.dart';
import 'package:reels_task/features/reels/presentation/widgets/reels_page_view.dart';

class ReelsScreen extends ConsumerStatefulWidget {
  static const routeName = '/reelsScreen';

  const ReelsScreen({super.key});

  @override
  ConsumerState<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends ConsumerState<ReelsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.watch(reelsNotifierProvider.notifier).getReels();
    });
  }

  @override
  Widget build(BuildContext context) {
    final reelsState = ref.watch(reelsNotifierProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Reels',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: _buildBody(reelsState),
    );
  }

  Widget _buildBody(ReelsStates reelsState) {
    if (reelsState is ReelsLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (reelsState is ReelsErrorState) {
      return Center(
        child: Text(
          reelsState.message,
          style: const TextStyle(color: Colors.white),
        ),
      );
    } else if (reelsState is ReelsSuccessState) {
      return ReelsPageView(reels: reelsState.reels);
    } else {
      return const SizedBox.shrink(); // Initial state, nothing to show
    }
  }
}