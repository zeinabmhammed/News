import 'package:intl/intl.dart';

extension StringToDateFormatter on String{
String formatArticleDate(){
  DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
  DateTime date = dateFormat.parse(this);
  DateFormat outputFormat = DateFormat("MMM dd, yyyy");
  return outputFormat.format(date);
}
}
