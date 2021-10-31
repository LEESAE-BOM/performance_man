import 'package:intl/intl.dart';

String subtractNMonths(DateTime minuend, int difference){
  if(difference < 0) return '1900-01-01';

  var year = minuend.year;
  var month = minuend.month;

  month = month - difference;
  if(month < 0) {
    year -= 1;
    month += 12;
  }
  var result = DateFormat('yyyy-M-d').parse('$year-$month-1');
  return DateFormat('yyyy-MM-dd').format(result);
}