import 'package:flutter/material.dart';
import '../models/wf_register_state.dart';

class WfPreviewToggles extends StatelessWidget {
  const WfPreviewToggles({
    super.key,
    required this.state,
    required this.onSelect,
  });

  final WfUrlState state;
  final ValueChanged<WfUrlState> onSelect;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Wrap(
          spacing: 10,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: [
            ChoiceChip(
              label: const Text('A001 未登録'),
              selected: state == WfUrlState.unregistered,
              onSelected: (_) => onSelect(WfUrlState.unregistered),
            ),
            ChoiceChip(
              label: const Text('A002 接続失敗'),
              selected: state == WfUrlState.connectFailed,
              onSelected: (_) => onSelect(WfUrlState.connectFailed),
            ),
            ChoiceChip(
              label: const Text('A003 登録済み'),
              selected: state == WfUrlState.registered,
              onSelected: (_) => onSelect(WfUrlState.registered),
            ),
          ],
        ),
      ),
    );
  }
}
