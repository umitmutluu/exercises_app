import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

OutlineInputBorder _outlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.1)),
    borderRadius: const BorderRadius.all(
      Radius.circular(10),
    ),
  );
}

class CustomTextFormField extends TextFormField {
  CustomTextFormField(
      {Key? key,
      required String hintText,
      String? toolTipName,
      TextStyle? textStyle,
      int? maxLine,
      Function(String)? onChanged,
      bool? showHelper,
      Color? colorCursor,
      bool? autoFocus,
      Widget? prefixIcon,
      Widget? suffixIcon,
      required TextEditingController controller,
      TextInputType? textInputType = TextInputType.text,
      int? maxLength,
      TextAlignVertical? textAlignVertical = TextAlignVertical.center})
      : super(
          key: key,
          onChanged: onChanged,
          keyboardType: textInputType,
          cursorColor: colorCursor,
          maxLength: maxLength,
          maxLines: maxLine,
          autofocus: autoFocus ?? false ? true : false,
          inputFormatters: <TextInputFormatter>[
            textInputType == TextInputType.number
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter,
          ],
          textAlignVertical: textAlignVertical ?? TextAlignVertical.center,
          decoration: InputDecoration(
              isDense: false,
              contentPadding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              prefixIcon: prefixIcon,
              prefixIconColor: Colors.grey,
              suffixIcon: suffixIcon,
              filled: true,
              helperStyle: showHelper ?? false
                  ? null
                  : const TextStyle(color: Colors.transparent),
              fillColor: Colors.white,
              hintText: hintText,
              errorBorder: _outlineInputBorder(),
              enabledBorder: _outlineInputBorder(),
              focusedBorder: _outlineInputBorder(),
              focusedErrorBorder: _outlineInputBorder()),
          controller: controller,
        );
}
