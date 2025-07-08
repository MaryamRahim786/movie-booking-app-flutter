import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_bearer_token_provider.g.dart';

@riverpod
class GetBearerToken extends _$GetBearerToken {
  @override
  String build() {
    return 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0NDA3ZGIzN2RiZmE5OTczN2YzYzMzOGJmOGEyZTZmNCIsIm5iZiI6MTc1MTc0MDkzNS4yNzYsInN1YiI6IjY4Njk3MjA3ZjRiOWIwOGJjMTUxZDZiNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.LKMrokkt6EUH8EQwfOhvBUobmahQHKcg98KTkT1A5vY';
  }
}
