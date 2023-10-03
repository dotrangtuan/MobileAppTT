import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';


class RealTime extends StatefulWidget {
  const RealTime({super.key});

  @override
  State<RealTime> createState() => _RealTimeState();
}

class _RealTimeState extends State<RealTime> {
  late Stream<DateTime> clockStream;


  @override
  void initState() {
    super.initState();

    // Tạo Stream để cập nhật thời gian mỗi giây
    clockStream = Stream<DateTime>.periodic(
      Duration(seconds: 1),
          (count) => DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: StreamBuilder<DateTime>(
        stream: clockStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final dateTime = snapshot.data;
            final formattedTime = DateFormat('dd-MM-yyyy HH:mm:ss').format(dateTime!);

            return Text(
              formattedTime,
            );
          } else {
            return Text(
              'Loading...',
            );
          }
        },
      ),
    );
    throw UnimplementedError();
  }
}
