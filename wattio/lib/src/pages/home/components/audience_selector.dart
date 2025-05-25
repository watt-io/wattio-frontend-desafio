import 'package:flutter/material.dart';
import 'package:wattio/src/modules/model/audience_type.dart';
import 'package:wattio/src/utils/app_theme.dart';

class AudienceSelector extends StatefulWidget {
  const AudienceSelector({super.key, required this.setAudienceType});

  final Function? setAudienceType;

  @override
  _AudienceSelectorState createState() => _AudienceSelectorState();
}

class _AudienceSelectorState extends State<AudienceSelector> {
  final List<String> audienceOptions = [
    'QUERO ECONOMIZAR EM CASA',
    'QUERO ECONOMIZAR NA MINHA EMPRESA',
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(audienceOptions.length, (index) {
        final isSelected = selectedIndex == index;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  isSelected ? WattioColors.surfaceTint : WattioColors.primary,
              foregroundColor: WattioColors.onTertiary,
              minimumSize: Size(double.infinity, 50),
            ),
            onPressed: () {
              FocusScope.of(context).unfocus();

              setState(() {
                selectedIndex = index;
              });
              if (widget.setAudienceType != null) {
                widget.setAudienceType!(
                  index == 0 ? AudienceType.pf : AudienceType.pj,
                );
              }
            },
            child: Text(audienceOptions[index]),
          ),
        );
      }),
    );
  }
}
