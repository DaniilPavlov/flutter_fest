import 'dart:math';

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
    const configuration = ScheduleRowSessionWidgetConfiguration(
      avatarUrl:
          'https://www.thechelseachronicle.com/static/uploads/17/2021/11/GettyImages-1236875236-768x512.jpg',
      speakerName: 'Timo Werner',
      sessionTitle: 'Zenit - Chelsea UCL group stage',
      isFavorite: true,
      progressStatus: ScheduleRowWidgetConfigurationProgressStatus.oncoming,
    );
    //IntrinsicHeight - это виджет, который можно использовать для изменения
    //высоты своего дочернего элемента на внутреннюю высоту дочернего элемента.
    //Это может быть полезно в тех случаях, когда доступное пространство
    //высоты неограничено, и вы хотите установить высоту виджета в соответствии
    //с его внутренней высотой.
    return IntrinsicHeight(
      //заменили роу на  кастом лэйаут
      child: SizedBox(
        height: 100,
        //infinity height
        child: CustomMultiChildLayout(
          delegate: RowLayoutDelegate(),
          children: [
            LayoutId(
              id: 1,
              child: const ScheduleRowTimeWidget(),
            ),
            LayoutId(
              id: 2,
              child: const ScheduleRowSessionWidget(
                configuration: configuration,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RowLayoutDelegate extends MultiChildLayoutDelegate {
  @override
  Size getSize(BoxConstraints constraints) {
    final size = super.getSize(constraints);
    return size;
  }

  @override
  void performLayout(Size size) {
    //общий размер 335 на 90
    const firstChildWidth = 48.0;
    const spaceChildWidth = 12.0;
    const secondChildXOffset = firstChildWidth + spaceChildWidth;
    var secondChildSize = Size.zero;
    if (hasChild(2)) {
      final maxWidth = size.width - secondChildXOffset;
      secondChildSize = layoutChild(
        2,
        BoxConstraints(maxWidth: maxWidth),
      );
    }
    if (hasChild(1)) {
      final maxHeight = max(secondChildSize.height, 90.0);
      layoutChild(
        1,
        BoxConstraints(
          maxWidth: firstChildWidth,
          maxHeight: maxHeight,
        ),
      );
    }
    positionChild(1, Offset.zero);
    positionChild(2, const Offset(secondChildXOffset, 0));
  }

  @override
  bool shouldRelayout(covariant RowLayoutDelegate oldDelegate) {
    return false;
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
