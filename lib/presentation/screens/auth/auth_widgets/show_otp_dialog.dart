import 'dart:async';
import 'package:flutter/material.dart';

class ShowOTPDialog extends StatefulWidget {
  final String phnNumber;
  final Function()? onVerify;
  final Function()? onResend;

  const ShowOTPDialog({
    super.key,
    required this.phnNumber,
    this.onVerify,
    this.onResend,
  });

  @override
  State<ShowOTPDialog> createState() => _ShowOTPDialogState();
}

class _ShowOTPDialogState extends State<ShowOTPDialog> {
  Timer? _timer;
  int _timeLeft = 0;
  bool _isResendDisabled = false;
  final TextEditingController _otpController = TextEditingController();

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      _timeLeft = 20;
      _isResendDisabled = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeLeft > 0) {
        setState(() {
          _timeLeft--;
        });
      } else {
        setState(() {
          _isResendDisabled = false;
        });
        _timer?.cancel();
      }
    });
  }

  void _handleResend() {
    _startTimer();
    widget.onResend?.call();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Verify OTP'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _otpController,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: const InputDecoration(
              hintText: 'Enter OTP',
              counterText: '',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: _isResendDisabled ? null : _handleResend,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[200],
                    foregroundColor: Colors.black,
                  ),
                  child: Text(
                    _isResendDisabled ? 'Resend in ${_timeLeft}s' : 'Resend',
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    widget.onVerify?.call();
                    Navigator.of(context).pop(_otpController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Verify'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
