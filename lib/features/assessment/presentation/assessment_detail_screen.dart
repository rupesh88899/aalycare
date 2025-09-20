import 'package:flutter/material.dart';

class AssessmentDetailScreen extends StatelessWidget {
  final String id;
  const AssessmentDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: BackButton(color: Theme.of(context).colorScheme.onSurface)),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(children: [
            Expanded(child: Text('Health Risk Assessment', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700))),
            const SizedBox(width: 12),
            Chip(avatar: const Icon(Icons.timer_outlined, size: 18), label: const Text('4 min')),
          ]),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset('assets/images/man_health_risk_assessment.png', height: 220, fit: BoxFit.cover),
          ),
          const SizedBox(height: 24),
          Text('What do you get ?', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          Wrap(spacing: 12, runSpacing: 12, children: const [
            _FeatureChip(icon: Icons.monitor_heart_outlined, label: 'Key Body Vitals'),
            _FeatureChip(icon: Icons.accessibility_new_outlined, label: 'Posture Analysis'),
            _FeatureChip(icon: Icons.monitor_weight_outlined, label: 'Body Composition'),
            _FeatureChip(icon: Icons.mail_outline, label: 'Instant Reports'),
          ]),
          const SizedBox(height: 24),
          Text('How we do it?', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset('assets/images/posture_analysis_icon.png', height: 220, fit: BoxFit.cover),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFFE8F6ED), borderRadius: BorderRadius.circular(16)),
            child: const Row(children: [Icon(Icons.shield_outlined, color: Colors.green), SizedBox(width: 8), Expanded(child: Text('We do not store or share your personal data'))]),
          ),
          const SizedBox(height: 16),
          const _StepList(),
          const SizedBox(height: 24),
          FilledButton(onPressed: () {}, child: const Text('Start')), 
        ],
      ),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: const Color(0xFFE6E8F0))),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon), const SizedBox(width: 8), Text(label)]),
    );
  }
}

class _StepList extends StatelessWidget {
  const _StepList();

  @override
  Widget build(BuildContext context) {
    final steps = const [
      'Ensure that you are in a well-lit space',
      'Allow camera access and place your device against a stable object or wall',
      'Avoid wearing baggy clothes',
      'Make sure you exercise as per the instruction provided by the trainer',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(steps.length, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('${index + 1}. ', style: Theme.of(context).textTheme.titleMedium),
              Expanded(child: Text(steps[index])),
            ]),
          )),
    );
  }
}
