class Utility {
  static String convertTime(int duration) {
    int hour = (duration / 3600).floor();
    String hourText = hour < 10 ? "0$hour:" : "$hour:";

    int min = ((duration % 3600 ) / 60).floor();
    String minText = min < 10 ? "0$min:" : "$min:";

    int second = ((duration % 3600) % 60);
    String secondText = second < 10 ? "0$second" : "$second";

    return hour > 0 ? hourText + minText + secondText : minText + secondText;
  }


  static double reverseMapValue(double input, double outputMin, double outputMax, double inputMin,
      double inputMax, ) {
    // Ánh xạ giá trị từ khoảng outputMin - outputMax sang khoảng inputMin - inputMax
    return ((input - outputMin) / (outputMax - outputMin)) * (inputMax - inputMin) + inputMin;
  }
}