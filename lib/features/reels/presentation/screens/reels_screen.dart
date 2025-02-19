import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reels_task/features/reels/presentation/providers/reels_notifier.dart';
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
      ref.read(reelsControllerProvider.notifier).getReels();
    });
  }

  @override
  Widget build(BuildContext context) {
    var reelsState = ref.watch(reelsControllerProvider);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Reels',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: reelsState.when(
        data: (reels) {
          if (reels.isEmpty) {
            return const Center(
              child: Text("No reels available", style: TextStyle(color: Colors.white)),
            );
          }
          return ReelsPageView(reels: reels);
        },
        error: (error, _) => Center(
          child: Text(error.toString(), style: const TextStyle(color: Colors.white)),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
