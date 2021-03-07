String getFormat(String time) {
  String h = time.substring(0, 2);
  String m = time.substring(3, 5);
  int hour;
  String format;
  if (int.parse(h) > 12) {
    hour = int.parse(h) - 12;
    format = "PM";
  } else {
    hour = int.parse(h);
    format = "AM";
  }
  return "0$hour:$m $format";
}
