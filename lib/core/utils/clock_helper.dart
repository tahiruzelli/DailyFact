class ClockHelper {
  List<String> clocks = [
    "10:00",
    "10:30",
    "11:00",
    "11:30",
    "12:00",
    "12:30",
    "13:00",
    "13:30",
    "14:00",
    "14:30",
    "15:00",
    "15:30",
    "16:00",
    "16:30",
    "17:00",
    "17:30",
    "18:00",
    "18:30",
    "19:00",
    "19:30",
    "20:00",
    "20:30",
    "21:00",
    "21:30",
    "22:00",
    "22:30",
    "23:00",
    "23:30",
  ];

  List<String> getEarliestClocks() {
    clocks.length = clocks.length - 4;
    return clocks;
  }

  List<String> getLatestClocks(String earliestClock) {
    int earliestIndex = clocks.indexOf(earliestClock);
    if (earliestIndex == -1) {
      return clocks;
    }
    List<String> latestClocks = clocks.sublist(earliestIndex);
    return latestClocks;
  }
}
