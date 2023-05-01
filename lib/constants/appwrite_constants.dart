// Fillout all these constants

class AppwriteConstants {
  static const String databaseId = 'appwrite db ID';
  static const String projectID = 'appwrite Project ID';
  static const String endPoint = 'IP address/v1';

  static const String usersCollection = '';
  static const String tweetsCollection = '';
  static const String notificationsCollection = '';

  static const String imagesBucket = '';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectID&mode=admin';
}

