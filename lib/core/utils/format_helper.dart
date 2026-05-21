import 'package:intl/intl.dart';

class FormatHelper{

  static String getFormattedDate(DateTime date) {
    return DateFormat('EEEE, d MMM, yyyy').format(date);
  }

}