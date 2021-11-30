import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row_session_widget.dart';

abstract class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({Key? key}) : super(key: key);

  factory ScheduleRowWidget.single({Key? key}) =>
      _ScheduleRowSingleSessionWidget(key: key);

  factory ScheduleRowWidget.multi({Key? key}) =>
      _ScheduleRowMultiSessionWidget(key: key);
}

class _ScheduleRowSingleSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowSingleSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://www.thechelseachronicle.com/static/uploads/17/2021/11/GettyImages-1236875236-768x512.jpg',
      speakerName: 'Frank Lampard',
      sessionTitle: 'Chelsea - Juventus UCL group stage',
      isFavorite: true,
      progressStatus:
          ScheduleRowSessionWidgetConfigurationProgressStatus.oncoming,
    );
    return Row(
      children: const [
        Expanded(
          child: ScheduleRowSessionWidget(
            configuration: configuration,
          ),
        ),
      ],
    );
  }
}

class _ScheduleRowMultiSessionWidget extends ScheduleRowWidget {
  const _ScheduleRowMultiSessionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
