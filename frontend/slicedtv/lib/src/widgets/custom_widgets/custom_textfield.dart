import 'package:flutter/material.dart';
import 'package:slicedtv/utils/conts/colors.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final bool isObsecure;
  final bool obsecureIcon;
  final Function(String) onChanged;
  CustomTextField(
      {this.textEditingController,
      this.isObsecure,
      this.obsecureIcon,
      this.onChanged});
  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isfocused;
  bool isObsecure;

  onClickedField() {
    setState(() {
      isfocused = true;
    });
  }

  onEditingComplete() {
    setState(() {
      isfocused = false;
    });
  }

  @override
  void initState() {
    super.initState();
    isfocused = false;
    isObsecure = widget.isObsecure;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 320,
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(
              width: isfocused == true ? 2 : 0,
              color: ColorPalette.purpleMedium),
          borderRadius: BorderRadius.circular(4),
          color: (isfocused == false) ? ColorPalette.greyMedium : Colors.black),
      child: Center(
        child: TextField(
          onChanged: widget.onChanged,
          obscureText: isObsecure,
          controller: widget.textEditingController,
          onTap: () {
            onClickedField();
          },
          cursorColor: ColorPalette.purpleMedium,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontFamily: "SF-PRO-TEXT"),
          decoration: InputDecoration(
              isDense: true,
              border: InputBorder.none,
              suffixIcon: widget.obsecureIcon == true
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isObsecure = !isObsecure;
                        });
                      },
                      child: Container(
                          width: 32,
                          height: 32,
                          child: Icon(
                            isObsecure == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: ColorPalette.greyLight,
                          )),
                    )
                  : null),
        ),
      ),
    );
  }
}
