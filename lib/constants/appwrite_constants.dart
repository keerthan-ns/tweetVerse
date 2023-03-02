// class AppwriteConstants {
//   static const String databaseId = '63faa62859f7c938adc2';
//   static const String projectID = '63faa404dd2a3aba1606';
//   // static const String endPoint = 'http://localhost:80/v1';
//   static const String endPoint = 'http://192.168.148.42:80/v1';

//   static const String usersCollection = '63fbb83eefb822e1d403';
//   static const String tweetsCollection = '63fc3365de1fd1737bfb';
//   static const String notificationsCollection = '63fea8d16de34c042fa7';

//   static const String imagesBucket = '63fc3ef1a64a7e498085';

//   static String imageUrl(String imageId) =>
//       '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectID&mode=admin';
// }

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