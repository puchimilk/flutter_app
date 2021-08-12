import 'dart:core';

a() {
  var calendar = [];
  var num = 0;
  
  for (var i = 0; i < 35; i++) {
    calendar.add({'date' : num + i});
  }
  
  return calendar;
}