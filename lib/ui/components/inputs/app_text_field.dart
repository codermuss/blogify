import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/extensions/string_extensions.dart';
import 'package:blogify/ui/styles/paddings.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../styles/radiuses.dart';

enum AppTextField { input, search }

class AppTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool autofocus;
  final bool enabled;
  final bool obscureText;
  final bool readOnly;
  final String? labelText;
  final TextStyle? labelStyle;
  final String? hintText;
  final double? height;
  final double? width;
  final int? maxLines;
  final int? maxLength;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final Widget? prefix;
  final String? Function(String?)? validator;
  final Function(bool)? onTapSuffix;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final AppTextField type;
  final bool standardBottomSpacing;

  const AppTextFormField({
    super.key,
    required this.controller,
    this.autofocus = false,
    this.enabled = true,
    this.obscureText = false,
    this.readOnly = false,
    this.labelText,
    this.labelStyle,
    this.hintText,
    this.height,
    this.width,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.suffix,
    this.prefix,
    this.validator,
    this.onTapSuffix,
    this.onChanged,
    this.focusNode,
    this.textInputAction = TextInputAction.done,
    this.type = AppTextField.input,
    this.standardBottomSpacing = true,
  });

  // * Note [codermuss]: For more complex scenarios the Factory methods can be use
  factory AppTextFormField.input({
    required TextEditingController controller,
    bool autofocus = false,
    bool enabled = true,
    bool obscureText = false,
    bool readOnly = false,
    String? labelText,
    TextStyle? labelStyle,
    String? hintText,
    double? height,
    double? width,
    int? maxLines,
    int? maxLength,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffix,
    Widget? prefix,
    String? Function(String?)? validator,
    Function(bool)? onTapSuffix,
    void Function(String)? onChanged,
    FocusNode? focusNode,
    InputBorder? border,
    TextInputAction textInputAction = TextInputAction.done,
  }) {
    return AppTextFormField(
      controller: controller,
      autofocus: autofocus,
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      labelText: labelText,
      labelStyle: labelStyle,
      hintText: hintText,
      height: height,
      width: width,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      suffix: suffix,
      prefix: prefix,
      validator: validator,
      onTapSuffix: onTapSuffix,
      onChanged: onChanged,
      focusNode: focusNode,
      // border: OutlineInputBorder(
      //   borderRadius: Radiuses.b8r,
      // ),
      textInputAction: textInputAction,
    );
  }

  factory AppTextFormField.search({
    required TextEditingController controller,
    bool autofocus = false,
    bool enabled = true,
    bool obscureText = false,
    bool readOnly = false,
    String? labelText,
    TextStyle? labelStyle,
    String? hintText,
    double? height,
    double? width,
    int? maxLines,
    int? maxLength,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    Widget? suffix,
    Widget? prefix,
    String? Function(String?)? validator,
    Function(bool)? onTapSuffix,
    void Function(String)? onChanged,
    FocusNode? focusNode,
    TextInputAction textInputAction = TextInputAction.done,
  }) {
    return AppTextFormField(
      controller: controller,
      autofocus: autofocus,
      enabled: enabled,
      obscureText: obscureText,
      readOnly: readOnly,
      labelText: labelText,
      labelStyle: labelStyle,
      hintText: hintText,
      height: height,
      width: width,
      maxLines: maxLines,
      maxLength: maxLength,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      suffix: suffix,
      prefix: prefix,
      validator: validator,
      onTapSuffix: onTapSuffix,
      onChanged: onChanged,
      focusNode: focusNode,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(100),
      // ),
      textInputAction: textInputAction,
    );
  }

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  final ValueNotifier<AutovalidateMode> _autoValidateMode = ValueNotifier(AutovalidateMode.disabled);

  @override
  void dispose() {
    _autoValidateMode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.standardBottomSpacing ? Paddings.p8v : EdgeInsets.zero,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return TextFormField(
              controller: widget.controller,
              validator: (value) {
                _autoValidateMode.value = AutovalidateMode.always;
                return widget.validator?.call(value);
              },
              autofocus: widget.autofocus,
              autovalidateMode: _autoValidateMode.value,
              enabled: widget.enabled,
              obscureText: widget.obscureText,
              readOnly: widget.readOnly,
              decoration: InputDecoration(
                fillColor: context.palette.gray01,
                filled: true,
                labelText: widget.labelText?.locale,
                labelStyle: widget.labelStyle,
                hintText: widget.hintText?.locale,
                hintStyle: AppTextStyles.footNote1.copyWith(color: context.palette.gray03),
                suffixIcon: widget.suffix,
                prefixIcon: widget.prefix,
                errorText: state.errorText,
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: widget.type == AppTextField.input ? Radiuses.b8r : BorderRadius.circular(100),
                  borderSide: BorderSide(color: context.palette.gray02),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: widget.type == AppTextField.input ? Radiuses.b8r : BorderRadius.circular(100),
                  borderSide: BorderSide(color: context.palette.gray02),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: widget.type == AppTextField.input ? Radiuses.b8r : BorderRadius.circular(100),
                  borderSide: BorderSide(color: context.palette.gray02),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: widget.type == AppTextField.input ? Radiuses.b8r : BorderRadius.circular(100),
                  borderSide: BorderSide(color: context.palette.gray02),
                ),
              ),
              maxLines: widget.obscureText ? 1 : widget.maxLines,
              maxLength: widget.maxLength,
              keyboardType: widget.keyboardType,
              inputFormatters: widget.inputFormatters,
              onChanged: widget.onChanged,
              onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
              focusNode: widget.focusNode,
              textInputAction: widget.textInputAction,
            );
          },
        ),
      ),
    );
  }
}
