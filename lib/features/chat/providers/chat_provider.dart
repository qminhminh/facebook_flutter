import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repository/chat_repository.dart';

final chatProvider = Provider(
  (ref) => ChatRepository(),
);
