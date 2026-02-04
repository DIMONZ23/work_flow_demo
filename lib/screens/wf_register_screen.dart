import 'package:flutter/material.dart';
import '../models/wf_register_state.dart';
import '../widgets/wf_error_banner.dart';
import '../widgets/wf_preview_toggles.dart';
import '../widgets/wf_register_dialog_card.dart';

class WfRegisterScreen extends StatefulWidget {
  const WfRegisterScreen({super.key});

  @override
  State<WfRegisterScreen> createState() => _WfRegisterScreenState();
}

class _WfRegisterScreenState extends State<WfRegisterScreen> {
  final TextEditingController _controller = TextEditingController();
  WfUrlState _state = WfUrlState.unregistered;

  @override
  void initState() {
    super.initState();
    _setState(WfUrlState.unregistered);
  }

  String get _statusLabel =>
      _state == WfUrlState.registered ? '登録済み' : '未登録';

  bool get _isSaveEnabled =>
      _state == WfUrlState.registered || _controller.text.isNotEmpty;

  void _setState(WfUrlState next) {
    setState(() {
      _state = next;
      if (next == WfUrlState.registered) {
        _controller.text = 'https://54.248.187.124/eteam/...';
      } else {
        _controller.clear();
      }
    });
  }

  void _handleSave() {
    if (!_isSaveEnabled) return;
    _setState(WfUrlState.registered);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency, 
      child: Stack(
        children: [
          
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.of(context).pop(),
            ),
          ),

          
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 16),
                WfUrlDialogCard(
                  statusLabel: _statusLabel,
                  controller: _controller,
                  isSaveEnabled: _isSaveEnabled,
                  onSave: _handleSave,
                  onChanged: (_) => setState(() {}),
                ),
              ],
            ),
          ),

          if (_state == WfUrlState.connectFailed)
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: WfErrorBanner(
                message: 'ワークフローに接続できません。',
              ),
            ),
        ],
      ),
    );
  }
}
