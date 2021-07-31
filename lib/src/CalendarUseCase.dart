// うるう年の確認
bool isLeapYear(int year) {
  return year % 400 == 0 || year % 4 == 0 && year % 100 != 0;
}

// 曜日の計算
int dayOfWeek(int year, int month, int day) {
  if (month == 1 || month == 2) {
    year -= 1;
    month += 12;
  }
  return (year + (year / 4).floor() - (year / 100).floor() + (year / 400).floor() + ((13 * month + 8) / 5).floor() + day) % 7;
}

// 4週の月
bool conditionFourWeeks(int _year, int _month) {
  var firstDayOfWeek = dayOfWeek(_year, _month, 1);
  return !isLeapYear(_year) && _month == 2 && firstDayOfWeek == 0;
}

// 6週の月
bool conditionSixWeeks(int _year, int _month) {
  var firstDayOfWeek = dayOfWeek(_year, _month, 1);
  var days = numberOfDay(_year, _month);
  return (firstDayOfWeek == 6 && days == 30) || (firstDayOfWeek >= 5 && days == 31);
}

int numberOfDay(int _year, int _month) {
  if (conditionFourWeeks(_year, _month)) {
    return 4;
  } else if (conditionSixWeeks(_year, _month)) {
    return 6;
  } else {
    return 5;
  }
}
