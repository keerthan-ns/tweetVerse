import 'package:appwrite/appwrite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tweetverse/constants/appwrite_constants.dart';
import 'package:tweetverse/core/core.dart';
import 'package:tweetverse/models/tweet_model.dart';
import 'package:appwrite/models.dart' as model;

final tweetAPIProvider = Provider((ref) {
  return TweetAPI(
    db: ref.watch(
      appwriteDatabaseProvider,
    ),
  );
});

abstract class ITweetAPI {
  FutureEither<model.Document> shareTweet(Tweet tweet);
}

class TweetAPI implements ITweetAPI{
  final Databases _db;
  TweetAPI({required Databases db}) : _db = db;
  @override
  FutureEither<model.Document> shareTweet(Tweet tweet) async{
    try {
      final document =  await _db.createDocument(
        databaseId: AppwriteConstants.databaseId,
        collectionId: AppwriteConstants.tweetsCollection,
        documentId: ID.unique(),
        data: tweet.toMap(),
      );
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

}