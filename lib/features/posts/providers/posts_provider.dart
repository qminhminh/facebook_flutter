import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repostiory/post_repository.dart';

final postsProvider = Provider((ref) {
  return PostRepository();
});
