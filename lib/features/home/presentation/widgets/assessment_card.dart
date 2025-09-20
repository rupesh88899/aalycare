import 'package:flutter/material.dart';

class AssessmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onTap;

  const AssessmentCard({super.key, required this.title, required this.subtitle, required this.imageAsset, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24), boxShadow: const [BoxShadow(color: Color(0x12000000), blurRadius: 10)]),
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset(imageAsset, width: 120, height: 110, fit: BoxFit.cover)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(subtitle, maxLines: 3, overflow: TextOverflow.ellipsis),
                const SizedBox(height: 8),
                Align(alignment: Alignment.centerLeft, child: FilledButton.icon(onPressed: onTap, icon: const Icon(Icons.play_arrow), label: const Text('Start'))),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}


