class DateFunctions {
  List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  //get currentMonth
  getCurrentMonth() {
    int monthIndex = DateTime.now().month;
    return monthIndex;
  }

  monthArrayWidget(year, month) {
    List monthArray = [];

    // Get the number of days in the month
    int numDays = DateTime(year, month + 1, 0).day;
    // Get the day of the week for the 1st day of the month (7 = Sunday, 6 = Saturday)
    int firstDayWeekday = DateTime(year, month, 1).weekday;

    int day = 1;
    if (firstDayWeekday == 7) {
      firstDayWeekday = 0;
    }

    while (day <= numDays) {
      List<String> week = [];
      for (int i = 0; i < 7; i++) {
        if (i < firstDayWeekday && monthArray.isEmpty) {
          week.add('');
        } else {
          if (day <= numDays) {
            week.add(day.toString());
            day++;
          } else {
            week.add('');
          }
        }
      }
      monthArray.add(week);
    }
    return monthArray;
  }

  getMonthsHeading(year, month) {
    return {
      'heading': '${months[month - 1]} $year',
      'month': month,
      'year': year
    };
  }
}
