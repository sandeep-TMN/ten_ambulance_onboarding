import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:ten_ambulance_onboarding/utils/colors.dart';

class AppTextInput extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? trailingIcon;
  final bool protected;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? textInputFormatters;

  const AppTextInput({
    super.key,
    required this.controller,
    this.hintText = '',
    this.prefixIcon,
    this.trailingIcon,
    this.protected = false,
    this.validator,
    this.textInputType,
    this.textInputFormatters,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  final FocusNode _focusNode = FocusNode();
  bool _hasFocus = false;
  bool show = false;
  final showIcon = Iconsax.eye_outline;
  final hideIcon = Iconsax.eye_slash_outline;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _hasFocus = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _focusNode.requestFocus(),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: _hasFocus ? AppColors.primaryLowAlpha : Colors.transparent,
          border: Border.all(
            color: _hasFocus ? AppColors.primaryLowAlpha : Color(0x11000000),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            widget.prefixIcon != null
                ? Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(widget.prefixIcon, color: AppColors.text),
                  )
                : Container(),
            SizedBox(
              width:
                  MediaQuery.sizeOf(context).width -
                  120 -
                  (widget.prefixIcon != null ? 10 : 0) -
                  (widget.trailingIcon != null ? 20 : 0) -
                  (widget.protected ? 10 : 0) -
                  (widget.trailingIcon != null && widget.protected ? 10 : 0),
              child: TextFormField(
                obscureText: widget.protected && !show,
                controller: widget.controller,
                focusNode: _focusNode,
                keyboardType: widget.textInputType,
                validator: widget.validator,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
                inputFormatters: widget.textInputFormatters,
                cursorColor: AppColors.primary,
                style: TextStyle(fontSize: 16),
              ),
            ),
            widget.trailingIcon != null
                ? Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(widget.trailingIcon, color: AppColors.text),
                  )
                : Container(),
            widget.protected
                ? GestureDetector(
                    onTap: () {
                      setState(() {
                        show = !show;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        show ? hideIcon : showIcon,
                        color: AppColors.text,
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
