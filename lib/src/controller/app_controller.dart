import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppController extends GetxController {
  var selectedDate = DateTime.now().obs;

  void updateDate(DateTime? date) {
    if (date != null) {
      selectedDate.value = date;
    }
  }

  String get formattedDay =>
      DateFormat('dd/MM/yyyy').format(selectedDate.value);

  var dateBeenSelected = false.obs;

  void dateSelected() {
    dateBeenSelected.value = true;
  }

  // time picker

  var hour = 10.obs;
  var minute = 30.obs;
  var period = "AM".obs;

  @override
  void onInit() {
    super.onInit();
    DateTime now = DateTime.now();
    hour.value = now.hour > 12 ? now.hour - 12 : now.hour;
    minute.value = now.minute;
    period.value = now.hour >= 12 ? "PM" : "AM";
  }

  void incrementHour() {
    if (hour.value == 12) {
      hour.value = 1;
    } else {
      hour.value++;
    }
  }

  void decrementHour() {
    if (hour.value == 1) {
      hour.value = 12;
    } else {
      hour.value--;
    }
  }

  void incrementMinute() {
    if (minute.value == 59) {
      minute.value = 0;
      incrementHour();
    } else {
      minute.value++;
    }
  }

  void decrementMinute() {
    if (minute.value == 0) {
      minute.value = 59;
      decrementHour();
    } else {
      minute.value--;
    }
  }

  void togglePeriod() {
    period.value = period.value == "AM" ? "PM" : "AM";
  }

  var timeBeenSelected = false.obs;

  void timeSelected() {
    timeBeenSelected.value = true;
  }
}
