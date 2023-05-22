import 'package:clean_app/feature/presentation/check_conection/check_internet_conection.dart';
import 'package:flutter/material.dart';
import 'connetion_status_value_notifier.dart';

class WarningWidgetValueNotifier extends StatefulWidget {
  const WarningWidgetValueNotifier({Key? key}) : super(key: key);

  @override
  _WarningWidgetValueNotifierState createState() => _WarningWidgetValueNotifierState();
}

class _WarningWidgetValueNotifierState extends State<WarningWidgetValueNotifier> {
  bool isShowing = false;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ConnetionStatusValueNotifier(),
      builder: (context, ConnectionStatus status, child) {
        if (status == ConnectionStatus.online) {
          if (isShowing) {
            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                isShowing = false;
              });
            });
          }
        } else {
          isShowing = true;
        }

        return Visibility(
          visible: isShowing,
          child: Container(
            padding: const EdgeInsets.all(16),
            height: 60,
            color: status == ConnectionStatus.online ? Colors.green : Colors.red,
            child: Row(
              children: [
                Icon(status == ConnectionStatus.online ? Icons.wifi : Icons.wifi_off),
                SizedBox(width: 8),
                Text(status == ConnectionStatus.online ? 'Internet Available.' : 'No internet connection.'),
              ],
            ),
          ),
        );
      },
    );
  }
}
