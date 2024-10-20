import 'package:blogify/extensions/context_extensions.dart';
import 'package:blogify/ui/styles/radiuses.dart';
import 'package:blogify/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../../app/app.bottomsheets.dart';
import '../../../../../app/app.locator.dart';
import 'checkbox_form_item.dart';

class CheckboxFormField extends StatefulWidget {
  final BuildContext context;
  final CheckboxFormItem checkboxFormItem;
  final void Function(bool?)? onChanged;
  final bool isRequired;
  const CheckboxFormField({
    super.key,
    required this.context,
    required this.checkboxFormItem,
    this.onChanged,
    this.isRequired = false,
  });

  @override
  State<CheckboxFormField> createState() => _CheckboxFormFieldState();
}

class _CheckboxFormFieldState extends State<CheckboxFormField> {
  late bool autoValidate;

  @override
  void initState() {
    super.initState();
    autoValidate = false;
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: false,
      autovalidateMode: autoValidate ? AutovalidateMode.always : AutovalidateMode.disabled,
      validator: (bool? value) {
        return ((value ?? false) || !widget.isRequired) ? null : '';
      },
      builder: (FormFieldState<bool> state) => Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 9,
                child: CheckboxListTile(
                  title: InkWell(
                    onTap: widget.checkboxFormItem.url == null
                        ? null
                        : () async {
                            SheetResponse? response = await locator<BottomSheetService>().showCustomSheet(
                              ignoreSafeArea: true,
                              title: widget.checkboxFormItem.title,
                              isScrollControlled: true,
                              enableDrag: false,
                              data: widget.checkboxFormItem,
                              variant: BottomSheetType.notice,
                            );
                            state.didChange(response?.confirmed == true);
                            widget.onChanged?.call(response?.confirmed == true);
                            setState(() {
                              autoValidate = true;
                            });
                          },
                    child: Text(
                      widget.checkboxFormItem.title,
                      style: AppTextStyles.footNote3.copyWith(color: widget.checkboxFormItem.url == null ? context.palette.gray04 : context.palette.greenSecondary),
                    ),
                  ),
                  contentPadding: EdgeInsets.zero,
                  value: state.value,
                  onChanged: (val) async {
                    state.didChange(val);
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  activeColor: context.palette.greenSecondary,
                  checkColor: context.palette.gray03,
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  checkboxShape: RoundedRectangleBorder(borderRadius: Radiuses.b4r),
                  dense: true,
                  side: BorderSide(color: context.palette.gray04, width: 1.w),
                ),
              ),
            ],
          ),
          if (state.hasError) Text(state.errorText!, style: AppTextStyles.footNote1),
        ],
      ),
    );
  }
}
