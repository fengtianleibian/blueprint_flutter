import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

import '../index.dart';

// 页面标题 组件
class PageTitleWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// 说明
  final String desc;

  const PageTitleWidget({
    super.key,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 使用 TextWidget.h2 显示标题，样式为二级标题
      TextWidget.h2(title),
      // 使用 TextWidget.label 显示说明，样式为标签
      TextWidget.label(desc),
    ]
        .toColumn(
          // 设置对齐方式为左对齐
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          // 设置内边距
          left: 10,
          // 设置上边距
          top: 10,
          // 设置下边距
          bottom: 30,
        );
  }
}
