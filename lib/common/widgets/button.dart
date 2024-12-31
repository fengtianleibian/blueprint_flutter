// 导入必要的包
import 'package:ducafe_ui_core/ducafe_ui_core.dart'; // UI 核心库
import 'package:flutter/material.dart'; // Flutter 核心包
import '../index.dart'; // 项目中的索引文件

/// 按钮样式的枚举类型
enum ButtonWidgetVariant {
  /// 主按钮样式
  primary,

  /// 次按钮样式
  secondary,

  /// 警告按钮样式
  destructive,

  /// 描边按钮样式
  outline,

  /// 幽灵按钮（无背景）
  ghost,

  /// 链接按钮（文本样式）
  link,

  /// 图标按钮
  icon,
}

/// 按钮组件
class ButtonWidget extends StatefulWidget {
  /// 按钮样式类型
  final ButtonWidgetVariant variant;

  /// 按钮的尺寸
  final WidgetScale scale;

  /// 按钮的点击事件回调
  final Function()? onTap;

  /// 按钮上的文字
  final String? text;

  /// 按钮文字颜色
  final Color? textColor;

  /// 按钮的子组件
  final Widget? child;

  /// 按钮上的图标
  final Widget? icon;

  /// 按钮的圆角大小
  final double? borderRadius;

  /// 按钮的背景颜色
  final Color? backgroundColor;

  /// 按钮的边框颜色
  final Color? borderColor;

  /// 按钮的宽度
  final double? _width;

  /// 按钮的高度
  final double? height;

  /// 按钮是否可用
  final bool enabled;

  /// 图标和文字之间的间距
  final double? iconSpace;

  /// 是否显示加载状态
  final bool? loading;

  /// 图标和文字是否反转位置
  final bool? reverse;

  /// 主轴对齐方式
  final MainAxisAlignment? mainAxisAlignment;

  /// 主轴尺寸
  final MainAxisSize? mainAxisSize;

  /// 按钮的阴影高度
  final double? elevation;

  /// 按钮组件的主构造函数
  const ButtonWidget({
    super.key,
    this.variant = ButtonWidgetVariant.primary, // 默认主按钮样式
    this.scale = WidgetScale.medium, // 默认中等尺寸
    this.onTap, // 点击事件回调
    this.text, // 按钮文字
    this.borderRadius, // 按钮圆角
    this.child, // 子组件
    this.backgroundColor, // 背景色
    this.icon, // 图标
    this.borderColor, // 边框颜色
    double? width, // 按钮宽度
    this.height, // 按钮高度
    this.enabled = true, // 默认按钮可用
    this.iconSpace, // 图标和文字间距
    this.loading, // 是否显示加载状态
    this.textColor, // 文字颜色
    this.reverse, // 是否反转图标和文字的位置
    this.mainAxisAlignment, // 主轴对齐方式
    this.mainAxisSize, // 主轴尺寸
    this.elevation, // 按钮阴影高度
  }) : _width = width;

  /// 自定义按钮样式的原始构造函数
  const ButtonWidget.raw({
    super.key,
    required this.variant, // 必需的按钮样式
    required this.scale, // 必需的尺寸
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    double? width,
    this.height,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  }) : _width = width;

  /// 快捷构造函数：主要按钮样式
  const ButtonWidget.primary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.primary;

  /// 快捷构造函数：次按钮样式
  const ButtonWidget.secondary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.secondary;

  /// 快捷构造函数：警告按钮样式
  const ButtonWidget.destructive(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariant.destructive;

  // 其他样式的构造函数省略，逻辑与上面类似

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

/// 按钮组件的状态类
class _ButtonWidgetState extends State<ButtonWidget> {
  /// 是否按下状态
  bool pressed = false;

  /// 按尺寸缩放
  double _size(double val) {
    switch (widget.scale) {
      case WidgetScale.medium:
        return val; // 中等尺寸
      case WidgetScale.small:
        return val * 0.7; // 缩小尺寸
      case WidgetScale.large:
        return val * 1.3; // 放大尺寸
    }
  }

  /// 获取文本颜色
  Color _textColor() {
    var colorScheme = context.colors.scheme;
    switch (widget.variant) {
      case ButtonWidgetVariant.primary:
        return widget.textColor ?? colorScheme.onPrimary;
      case ButtonWidgetVariant.secondary:
        return widget.textColor ?? colorScheme.onSecondary;
      default:
        return widget.textColor ?? colorScheme.onPrimaryContainer;
    }
  }

  /// 其他样式方法省略，逻辑类似...

  /// 主视图构建
  Widget _buildView() {
    // 子组件逻辑...
    return Container(); // 实现的逻辑略去
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
