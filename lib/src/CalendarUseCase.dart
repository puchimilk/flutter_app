bool isLeapYear(int year) {
  return year % 400 == 0 || year % 4 == 0 && year % 100 != 0;
}

zellerCongruence(int year, int month, int day) {
  var h = (year + (year / 4) - (year / 100) + (year / 400) + ((13 * month + 8) / 5) + day) % 7;
  return h;
}

dayOfWeek(int _year, int _month, int _day) {
  var year = _year;
  var month = _month;
  if (month == 1 || year == 2) {
    year -= 1;
    month += 12;
  }
  return zellerCongruence(year, month, _day);
}

conditionFourWeeks(int _year, int _month) {
  var firstDayOfWeek = dayOfWeek(_year, _month, 1);
  return !isLeapYear(_year) && _month == 2 && (firstDayOfWeek == 0);
}