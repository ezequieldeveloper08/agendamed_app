import 'package:flutter/material.dart';

enum ButtonVariant {
  defaultVariant,
  secondary,
  destructive,
  outline,
  ghost,
  link,
}

enum ButtonSize { small, medium, large, icon }

class Button extends StatelessWidget {
  final String? label;
  final IconData? icon;
  final ButtonVariant variant;
  final ButtonSize size;
  final VoidCallback onPressed;
  final bool fullWidth;
  final bool isLoading;

  const Button({
    super.key,
    this.label,
    this.icon,
    required this.onPressed,
    this.variant = ButtonVariant.defaultVariant,
    this.size = ButtonSize.medium,
    this.fullWidth = false,
    this.isLoading = false,
  });

  Color _getBackgroundColor(BuildContext context) {
    switch (variant) {
      case ButtonVariant.defaultVariant:
        return Theme.of(context).primaryColor;
      case ButtonVariant.secondary:
        return Colors.grey.shade300;
      case ButtonVariant.destructive:
        return Colors.red;
      case ButtonVariant.outline:
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return Colors.transparent;
    }
  }

  Color _getTextColor(BuildContext context) {
    switch (variant) {
      case ButtonVariant.defaultVariant:
      case ButtonVariant.destructive:
        return Colors.white;
      case ButtonVariant.outline:
      case ButtonVariant.secondary:
        return Colors.black87;
      case ButtonVariant.ghost:
      case ButtonVariant.link:
        return Theme.of(context).primaryColor;
    }
  }

  double _getPadding() {
    switch (size) {
      case ButtonSize.small:
        return 8;
      case ButtonSize.medium:
        return 12;
      case ButtonSize.large:
        return 16;
      case ButtonSize.icon:
        return 12;
    }
  }

  double _getFontSize() {
    switch (size) {
      case ButtonSize.small:
        return 12;
      case ButtonSize.medium:
        return 14;
      case ButtonSize.large:
        return 16;
      case ButtonSize.icon:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderColor = variant == ButtonVariant.outline
        ? Colors.black87
        : Colors.transparent;

    Widget buttonContent = Container(
      height: 56,
      decoration: BoxDecoration(
        color: _getBackgroundColor(context),
        border: Border.all(color: borderColor, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: isLoading
            ? null
            : onPressed, // 👈 desativa clique quando loading
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: _getPadding(),
            horizontal: size == ButtonSize.icon
                ? _getPadding()
                : _getPadding() * 2,
          ),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: size == ButtonSize.small ? 14 : 18,
                    width: size == ButtonSize.small ? 14 : 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        _getTextColor(context),
                      ),
                    ),
                  )
                : Row(
                    mainAxisSize: fullWidth
                        ? MainAxisSize.max
                        : MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null)
                        Icon(icon, size: 18, color: _getTextColor(context)),
                      if (label != null && size != ButtonSize.icon) ...[
                        if (icon != null) const SizedBox(width: 6),
                        Text(
                          label!,
                          style: TextStyle(
                            fontSize: _getFontSize(),
                            fontWeight: FontWeight.w700,
                            color: _getTextColor(context),
                            decoration: variant == ButtonVariant.link
                                ? TextDecoration.underline
                                : TextDecoration.none,
                          ),
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );

    return fullWidth
        ? SizedBox(width: double.infinity, child: buttonContent)
        : buttonContent;
  }
}
