import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

enum Logo { google, apple }

class WeTextField extends StatelessWidget {
  final String lable;
  final bool locked;
  final bool obscureText;
  final bool searchable;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final VoidCallback? onVisibilityChange;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const WeTextField({
    Key? key,
    required this.lable,
    this.locked = false,
    this.obscureText = false,
    this.searchable = false,
    this.onVisibilityChange,
    this.controller,
    this.onSaved,
    this.prefixIcon,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: searchable ? Colors.grey[200] : whiteColor,
          borderRadius: BorderRadius.circular(searchable ? 8 : 4),
          border: !searchable ? Border.all(color: borderColor) : null),
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        onSaved: onSaved,
        validator: validator,
        decoration: InputDecoration(
          hintText: lable,
          prefixIcon: prefixIcon ??
              (searchable ? const Icon(Icons.search) : Icon(locked ? Icons.lock : Icons.email, color: primaryColor)),
          suffixIcon: locked
              ? GestureDetector(
                  onTap: onVisibilityChange, child: Icon(obscureText ? Icons.visibility_off : Icons.visibility))
              : null,
          border: InputBorder.none,
        ),
        obscureText: obscureText,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}

class WeButton extends StatelessWidget {
  final double? height;
  final double? width;
  final String lable;
  final bool border;
  final VoidCallback? onTap;
  final Color? color;
  const WeButton({
    Key? key,
    this.height,
    this.width,
    required this.lable,
    this.onTap,
    this.border = false,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: height ?? 40,
        width: width ?? MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: border ? whiteColor : color ?? primaryColor,
          borderRadius: BorderRadius.circular(6),
          border: border ? Border.all(color: borderColor) : null,
        ),
        child: Text(lable, style: border ? btnTextStyle.copyWith(color: borderColor) : btnTextStyle),
      ),
    );
  }
}

class WeScaffold extends StatelessWidget {
  final Widget? body;
  final PreferredSizeWidget? appBar;
  final bool scrollable;
  final Widget? bottomNavigationBar;
  final double? padding;
  final bool topMargin;
  const WeScaffold({
    Key? key,
    this.body,
    this.appBar,
    this.scrollable = true,
    this.padding,
    this.topMargin = true,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        top: topMargin,
        child: Center(
          child: scrollable
              ? SingleChildScrollView(
                  child: Padding(padding: EdgeInsets.all(padding ?? 24), child: body),
                )
              : Padding(padding: EdgeInsets.all(padding ?? 16), child: body),
        ),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class WeSocialButton extends StatelessWidget {
  final Logo logo;
  final VoidCallback? onTap;
  const WeSocialButton({Key? key, required this.logo, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: logo == Logo.google ? blueColor : blackColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
              child: Image.asset(
                logo == Logo.google ? 'assets/icons/google.png' : 'assets/icons/apple.png',
              ),
            ),
            const SizedBox(width: 8),
            Text(
              logo == Logo.google ? 'Google Account' : 'Apple ID',
              style: socialBtnTextStyle.copyWith(color: logo == Logo.google ? blueColor : blackColor),
            )
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget weAppBar(String title, {Widget? leading}) {
  return AppBar(
    elevation: 0.0,
    leading: leading,
    centerTitle: true,
    title: Text(title),
  );
}

Widget weLogo() {
  return SizedBox(height: 72, child: Image.asset('assets/logo.png'));
}

toaster(BuildContext context, String msg) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(msg, textAlign: TextAlign.center),
      behavior: SnackBarBehavior.floating,
    ),
  );
}

Widget svgHolder(String assetName, {Color? color}) {
  return SvgPicture.asset(assetName, color: color ?? blackColor);
}
