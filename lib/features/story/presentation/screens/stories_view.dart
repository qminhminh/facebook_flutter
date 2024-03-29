import 'package:facebook_flu/features/story/presentation/screens/story_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/screens/loader.dart';
import '../../providers/get_all_stories_provider.dart';
import '../widgets/add_story_tile.dart';
import '../widgets/story_tile.dart';

class StoriesView extends ConsumerWidget {
  const StoriesView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storyData = ref.watch(getAllStoriesProvider);

    return storyData.when(
      data: (stories) {
        return SliverToBoxAdapter(
          child: Container(
            height: 200,
            color: AppColors.realWhiteColor,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const AddStoryTile();
                }

                final story = stories.elementAt(index - 1);

                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      StoryViewScreen.routeName,
                      arguments: stories.toList(),
                    );
                  },
                  child: StoryTile(
                    imageUrl: story.imageUrl,
                  ),
                );
              },
            ),
          ),
        );
      },
      error: (error, stackTrace) {
        return SliverToBoxAdapter(
          child: Text(error.toString()),
        );
      },
      loading: () {
        return const SliverToBoxAdapter(
          child: Loader(),
        );
      },
    );
  }
}
