import 'package:flutter/material.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row_session_widget.dart';
import 'package:flutter_fest/application/ui/widgets/schedule_row_time_widget.dart';

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
    const progressStatus = ScheduleRowWidgetConfigurationProgressStatus.current;
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://www.thechelseachronicle.com/static/uploads/17/2021/11/GettyImages-1236875236-768x512.jpg',
      speakerName: 'Timo Werner',
      sessionTitle: 'Zenit 3 - 3 Chelsea UCL group stage',
      isFavorite: true,
      progressStatus: progressStatus,
    );

    const exampleLecture = ScheduleRowTimeWidgetConfiguration(
      startTime: "21:45",
      endTime: "23:30",
      progressStatus: progressStatus,
    );

    // IntrinsicHeight - это виджет, который можно использовать для изменения
    // высоты своего дочернего элемента на внутреннюю высоту дочернего элемента.
    // Это может быть полезно в тех случаях, когда доступное пространство
    // высоты неограничено, и вы хотите установить высоту виджета в соответствии
    // с его внутренней высотой.

    // с учетом того, что у нас максимум будет 10 ячеек с лекциями,
    // останавливаемся на варианте с IntrinsicHeight (проблем с
    // производительностью не будет)
    // для больших списков тако подход не годится, потому что динамические
    // рассчеты очень тяжелы
    return IntrinsicHeight(
      child: Row(
        children: const [
          ScheduleRowTimeWidget(
            configuration: exampleLecture,
          ),
          SizedBox(width: 12),
          Expanded(
            child: ScheduleRowSessionWidget(
              configuration: configuration,
            ),
          ),
        ],
      ),
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

enum ScheduleRowWidgetConfigurationProgressStatus {
  oncoming,
  current,
  past,
}
