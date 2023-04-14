import 'package:flutter/material.dart';
import 'package:health_market/widgets/buttons.dart';

import '../widgets/text_bloc.dart';

class DescriptionsPage extends StatefulWidget {
  const DescriptionsPage();

  @override
  State<DescriptionsPage> createState() => _DescriptionsPageState();
}

class _DescriptionsPageState extends State<DescriptionsPage> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextBlocWidget(
              body: 'по 1 капсуле 2 раза в день во время приема пищи.',
              title: 'Способ применения',
            ),
            const SizedBox(height: 25),
            const TextBlocWidget(
              body:
                  'аминокислоты L-теанина – 200 мг* *Содержание не превышает верхний допустимый уровень суточного потребления. Не является лекарственным средством.',
              title: 'Содержание в суточной дозировке (2 капсулы)',
            ),
            const SizedBox(height: 25),
            const TextBlocWidget(
              body:
                  'аминокислоты L-теанина – 200 мг* *Содержание не превышает верхний допустимый уровень суточного потребления. Не является лекарственным средством.',
              title: 'Содержание в суточной дозировке (2 капсулы)',
            ),
            if (!_isExpanded) const SizedBox(height: 25),
            if (!_isExpanded)
              const TextBlocWidget(
                body:
                    'аминокислоты L-теанина – 200 мг* *Содержание не превышает верхний допустимый уровень суточного потребления. Не является лекарственным средством.',
                title: 'Содержание в суточной дозировке (2 капсулы)',
              ),
            if (!_isExpanded) const SizedBox(height: 25),
            if (!_isExpanded)
              const TextBlocWidget(
                  title: 'Противопоказания',
                  body:
                      'индивидуальная непереносимость компонентов, беременность, кормление грудью. Концентрат на основе растительного сырья «Мозговая активность» - это эффективная формула улучшения когнитивных функций с важнейшей аминокислотой L-теанином и экстрактом гинкго билоба. Комплекс для улучшения концентрации, памяти и внимания поддерживает умственную активность, способствует улучшению коммуникации нервных клеток, восстанавливает работу мозга. L-теанин – аминокислота природного происхождения, которая повышает стрессоустойчивость организма и его...'),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 30,
            child: Expanded(
              child: SmallButton(
                title: !_isExpanded ? "Свернуть" : 'Показать больше',
                onPressed: () {
                  _isExpanded = !_isExpanded;
                  setState(() {});
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
