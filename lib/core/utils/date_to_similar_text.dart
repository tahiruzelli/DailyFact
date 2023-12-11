
mixin DateTimeFunctions {
  String dateToSimilarText(DateTime date) {
    DateTime now = DateTime.now();
    int differenceInMinute = now.difference(date).inMinutes;
    if (differenceInMinute < 2) {
      return "Just Now";
    } else if (differenceInMinute < 60) {
      // less then hour
      return "$differenceInMinute minutes ago";
    } else if (differenceInMinute < 1440) {
      // less then day
      return "${differenceInMinute ~/ 60} hours ago";
    } else if (differenceInMinute < 10080) {
      // less then week
      return "${differenceInMinute ~/ 1440} days ago";
    } else if (differenceInMinute < 43829) {
      // less then month
      return "${differenceInMinute ~/ 10080} weeks ago";
    } else if (differenceInMinute < 525948) {
      // less then year
      return "${differenceInMinute ~/ 43829} months ago";
    } else {
      return "${differenceInMinute ~/ 525948} years ago";
    }
  }

  String dateTimeToClearText(String date, {bool time = false}) {
    if (date.isEmpty) {
      return "";
    }
    DateTime dateTime = DateTime.parse(date);
    if (dateTime.year == 1) {
      return "";
    }
    String day = "";
    String month = "";
    if (dateTime.day < 10) {
      day = "0${dateTime.day}";
    } else {
      day = dateTime.day.toString();
    }

    if (dateTime.month < 10) {
      month = "0${dateTime.month}";
    } else {
      month = dateTime.month.toString();
    }
    if (time) {
      String hour = "";
      String minute = "";
      if (dateTime.hour < 10) {
        hour = "0${dateTime.hour}";
      } else {
        hour = dateTime.hour.toString();
      }

      if (dateTime.minute < 10) {
        minute = "0${dateTime.minute}";
      } else {
        minute = dateTime.minute.toString();
      }
      return "$day/$month/${dateTime.year} $hour:$minute";
    } else {
      return "$day/$month/${dateTime.year}";
    }
  }

  String secondToTime(int secondd) {
    int minute = 0;
    int second = 0;
    minute = secondd ~/ 60;
    second = secondd - (minute * 60);
    String text = "";
    if (minute < 10) {
      text = "0$minute:";
    } else {
      text = "$minute:";
    }
    if (second < 10) {
      text = "${text}0$second";
    } else {
      text = text + second.toString();
    }
    return text;
  }

  String nowToRequestDate({DateTime? dt}) {
    DateTime date = dt ?? DateTime.now();
    String requestDate = "";
    requestDate = date.toString().split(" ").first;
    requestDate = "${requestDate}T";
    requestDate = requestDate + date.toString().split(" ").last;
    requestDate = "${requestDate}Z";
    return requestDate;
  }

  // String monthIndexToMonthIndex(int index) {
  //   switch (index) {
  //     case 1:
  //       return localizationService.translate("january");
  //     case 2:
  //       return localizationService.translate("february");
  //     case 3:
  //       return localizationService.translate("march");
  //     case 4:
  //       return localizationService.translate("april");
  //     case 5:
  //       return localizationService.translate("may");
  //     case 6:
  //       return localizationService.translate("june");
  //     case 7:
  //       return localizationService.translate("july");
  //     case 8:
  //       return localizationService.translate("august");
  //     case 9:
  //       return localizationService.translate("september");
  //     case 10:
  //       return localizationService.translate("october");
  //     case 11:
  //       return localizationService.translate("november");
  //     case 12:
  //       return localizationService.translate("december");
  //     default:
  //       return "";
  //   }
  // }
}
