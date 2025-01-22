import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/di/service_locator.dart';
import '../cubit/reals_cubit.dart';
import '../cubit/reals_state.dart';
import '../widgets/reels_page_view.dart';

class ReelsScreen extends StatelessWidget {
  static const routeName = '/reelsScreen';

  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Reels',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: BlocProvider(
        create: (context) => serviceLocator.get<ReelsCubit>()..getReels(),
        child: BlocBuilder<ReelsCubit, ReelsState>(
          builder: (context, state) {
            if (state is ReelsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.blue,
                ),
              );
            } else if (state is ReelsErrorState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      state.message,
                      style: TextStyle(color: Colors.red, fontSize: 16.sp),
                    ),
                    SizedBox(height: 16.sp),
                    ElevatedButton(
                      onPressed: () => context.read<ReelsCubit>().getReels(),
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            } else if (state is ReelsSuccessState) {
              return ReelsPageView(reels: state.reels);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
