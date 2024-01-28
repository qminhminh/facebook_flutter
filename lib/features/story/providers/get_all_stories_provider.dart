// ignore_for_file: avoid_print

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/firebaes_collection_names.dart';
import '../../../core/constants/firebase_field_names.dart';
import '../../auth/providers/get_user_info_provider.dart';
import '../models/story.dart';

final getAllStoriesProvider =
    StreamProvider.autoDispose<Iterable<Story>>((ref) {
  final controller = StreamController<Iterable<Story>>();
  final userData = ref.watch(getUserInfoProvider);

  userData.whenData((user) {
    final myFriends = [
      ...user.friends,
      user.uid,
    ];

    final now = DateTime.now().toUtc();
    final yesterday = now.subtract(const Duration(days: 1));

    print("Query Parameters: ${yesterday.millisecondsSinceEpoch}, $myFriends");

    final sub = FirebaseFirestore.instance
        .collection(FirebaseCollectionNames.stories)
        //.orderBy("created_at", descending: true)
        //  .where("created_at", isGreaterThan: yesterday.millisecondsSinceEpoch)
        .where(FirebaseFieldNames.authorId, whereIn: myFriends)
        .snapshots()
        .listen((snapshot) {
      final stories = snapshot.docs.map(
        (storyData) => Story.fromMap(
          storyData.data(),
        ),
      );
      controller.sink.add(stories);
    });

    ref.onDispose(() {
      controller.close();
      sub.cancel();
    });
  });

  return controller.stream;
});
