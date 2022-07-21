import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'state/hw_textfield_state.dart';

class HwTextfield extends StatefulWidget {
  final HwTextfieldState state;
  final bool autofocus;
  final bool obscureText;
  final String? label;
  final String? errorLabel;
  final IconData? icon;
  final int? maxLines;
  final bool expands;
  final bool topAlign;
  final double fontSize;
  final double height;
  final Function()? onSubmit;
  final Function()? onChanged;
  final Function()? onTap;
  final Function()? onFocusGet;
  final Function()? onFocusLost;

  HwTextfield({
    Key? key,
    required this.state,
    this.autofocus = false,
    this.label,
    this.errorLabel,
    this.icon,
    this.height = 50,
    this.fontSize = 16,
    this.obscureText = false,
    this.maxLines = 1,
    this.expands = false,
    this.topAlign = false,
    this.onSubmit,
    this.onTap,
    this.onChanged,
    this.onFocusGet,
    this.onFocusLost,
  }) : super(key: key);

  @override
  _HwTextfieldState createState() => _HwTextfieldState();
}

class _HwTextfieldState extends State<HwTextfield> {
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_controller.text != widget.state.value) _controller.text = widget.state.value;
        if (widget.onFocusGet != null) widget.state.onFocusGet = widget.onFocusGet;
        if (widget.onFocusLost != null) widget.state.onFocusLost = widget.onFocusLost;
        return _makeTextfield(widget);
      },
    );
  }

  Container _makeTextfield(HwTextfield widget) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 6, 0, 0),
      height: widget.height,
      child: TextField(
        readOnly: widget.state.readonly,
        enabled: !widget.state.locked,
        controller: _controller,
        textAlignVertical: widget.topAlign ? TextAlignVertical.top : TextAlignVertical.center,
        maxLines: widget.expands ? null : widget.maxLines,
        minLines: widget.expands ? null : 1,
        expands: widget.expands,
        autofocus: widget.autofocus,
        obscureText: widget.obscureText,
        keyboardType: widget.state.numeric ? TextInputType.number : null,
        inputFormatters: widget.state.numeric ? <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r'[0-9|.]'))] : null,
        onChanged: (value) {
          widget.state.value = value;
          if (widget.onChanged != null) widget.onChanged!();
        },
        focusNode: widget.state.focusNode,
        onSubmitted: (value) {
          // Trim the value beforehand
          // Note: value gets also trimmed when _onFocusChanged is triggert: see HwTextfieldState._onFocusChanged
          widget.state.value = widget.state.value.trim();
          if (widget.onSubmit != null) widget.onSubmit!();
        },
        onTap: () {
          if (widget.onTap != null) widget.onTap!();
        },
        style: widget.state.readonly
            ? TextStyle(
                fontSize: widget.fontSize,
                color: Colors.grey,
              )
            : TextStyle(
                fontSize: widget.fontSize,
                color: Colors.white,
              ),
        decoration: InputDecoration(
          icon: widget.state.locked ? Icon(Icons.lock) : null,
          labelText: widget.label,
          floatingLabelStyle: TextStyle(textBaseline: TextBaseline.alphabetic, height: 0.05),
          labelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: widget.fontSize,
          ),
          errorText: widget.state.invalid ? widget.errorLabel : null,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// class NoKeyboardTextState extends EditableTextState {
//   @override
//   void requestKeyboard() {
//     super.requestKeyboard();
//     //hide keyboard
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
//   }
// }

// class TextfieldNoKeyboard extends Textfield {
//   @override
//   void requestKeyboard() {
//     super.requestKeyboard();
//     //hide keyboard
//     SystemChannels.textInput.invokeMethod('TextInput.hide');
//   }
// }
