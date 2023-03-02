class AppwriteConstants {
  static const String databaseId = '63ff43b37f21fc071917';
  static const String projectID = '63ff423f8bd01a2858f2';
  static const String endPoint = 'http://20.198.109.101/v1';

  static const String usersCollection = '63ff468fac24bd067438';
  static const String tweetsCollection = '63ff44acbee8a5541830';
  static const String notificationsCollection = '63ff43d1b09e2dcd813c';

  static const String imagesBucket = '63ff4783c3cae6367868';

  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectID&mode=admin';
}