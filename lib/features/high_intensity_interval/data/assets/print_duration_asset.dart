String printDuration(Duration duration) {
  String formattedDuration = "";
  if (duration.inHours != 0) formattedDuration += "${duration.inHours}h ";
  if (duration.inMinutes.remainder(60) != 0)
    formattedDuration += "${duration.inMinutes.remainder(60)}m ";
  if (duration.inSeconds.remainder(60) != 0)
    formattedDuration += "${duration.inSeconds.remainder(60)}s";
  return formattedDuration;
}
