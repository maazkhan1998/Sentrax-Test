import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? prefixIconPath, hintText;
  final TextInputType? textInputType;
  final bool obscureText;
  final InputDecoration? decoration;
  final TextAlign textAlign;
  final Function(String val)? onChange;
  final TextStyle? textStyle;
  final String? initialValue;
  final FocusNode? focusNode;
  final void Function()? onTap;
  final void Function(String?)? onFieldSubmitted;
  final double? textFieldHeight;
  final double? textFieldWidth;
  final bool readOnly;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final Color? fillColor;
  final Color? cursorColor;
  final int? minLines;
  final int maxLines;
  final Widget? suffixIcon;
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.obscureText = false,
      this.prefixIconPath = "",
      this.hintText = "",
      this.focusNode,
      this.textFieldHeight,
      this.minLines,
      this.maxLines = 1,
      this.suffixIcon,
      this.hintStyle,
      this.fillColor,
      this.readOnly = false,
      this.onChange,
      this.onTap,
      this.onFieldSubmitted,
      this.textStyle,
      this.textAlign = TextAlign.start,
      this.initialValue,
      this.decoration,
      this.contentPadding,
      this.cursorColor,
      this.textFieldWidth,
      this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: textFieldHeight,
      width: textFieldWidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 0),
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10)
          ]),
      child: TextFormField(
        readOnly: readOnly,
        minLines: minLines,
        maxLines: maxLines,
        controller: controller,
        cursorColor: cursorColor ?? Theme.of(context).primaryColor,
        textAlignVertical: TextAlignVertical.center,
        style: textStyle,
        initialValue: initialValue,
        keyboardType: textInputType,
        textAlign: textAlign,
        obscureText: obscureText,
        onTap: onTap,
        onFieldSubmitted: onFieldSubmitted,
        onChanged: onChange,
        focusNode: focusNode,
        decoration: decoration ??
            InputDecoration(
              hintText: hintText,
              suffixIcon: suffixIcon,
              fillColor: fillColor ?? const Color(0XFFF8F8F8),
              filled: true,
              hintStyle: hintStyle,
              contentPadding: contentPadding,
              border: InputBorder.none,
            ),
      ),
    );
  }
}
