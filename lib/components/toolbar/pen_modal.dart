
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:saber/components/canvas/tools/_tool.dart';
import 'package:saber/components/canvas/tools/highlighter.dart';
import 'package:saber/components/canvas/tools/pen.dart';
import 'package:saber/components/toolbar/size_picker.dart';
import 'package:saber/i18n/strings.g.dart';

class PenModal extends StatefulWidget {
  const PenModal({
    super.key,
    required this.getTool,
    required this.setTool,
  });

  final Tool Function() getTool;
  final void Function(Pen) setTool;

  @override
  State<PenModal> createState() => _PenModalState();
}

class _PenModalState extends State<PenModal> {
  @override
  Widget build(BuildContext context) {
    final Tool currentTool = widget.getTool();
    final Pen currentPen;
    if (currentTool is Pen) {
      currentPen = currentTool;
    } else {
      return const SizedBox();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizePicker(
          pen: currentPen,
        ),

        if (currentPen is! Highlighter) ...[
          const SizedBox(width: 8),
          IconButton(
            onPressed: () => setState(() {
              widget.setTool(Pen.fountainPen());
            }),
            style: TextButton.styleFrom(
              foregroundColor: Pen.currentPen.icon == Pen.fountainPenIcon
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              backgroundColor: Pen.currentPen.icon == Pen.fountainPenIcon
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                  : Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.pens.fountainPen,
            icon: const FaIcon(Pen.fountainPenIcon, size: 16),
          ),
          IconButton(
            onPressed: () => setState(() {
              widget.setTool(Pen.ballpointPen());
            }),
            style: TextButton.styleFrom(
              foregroundColor: Pen.currentPen.icon == Pen.ballpointPenIcon
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.onSurface,
              backgroundColor: Pen.currentPen.icon == Pen.ballpointPenIcon
                  ? Theme.of(context).colorScheme.secondary.withOpacity(0.1)
                  : Colors.transparent,
              shape: const CircleBorder(),
            ),
            tooltip: t.editor.pens.ballpointPen,
            icon: const FaIcon(Pen.ballpointPenIcon, size: 16),
          ),
        ],
      ],
    );
  }
}
