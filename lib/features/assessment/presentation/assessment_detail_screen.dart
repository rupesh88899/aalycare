import 'package:flutter/material.dart';

class AssessmentDetailScreen extends StatelessWidget {
  final String id;
  const AssessmentDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Green gradient header section
          Container(
            height: 400,
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment(0.5, 1.22),
                radius: 1.22,
                colors: [
                  Color(0x4D91B655), // rgba(145, 182, 85, 0.5)
                  Color(0x4D69F5BB), // rgba(105, 245, 187, 0.5)
                ],
                stops: [0.0, 1.0],
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top bar with back button only
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    // Title and image row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Health Risk Assessment',
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF222E58),
                                ),
                              ),
                              const SizedBox(height: 12),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.timer_outlined,
                                      color: Color(0xFF222E58),
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      '4 min',
                                      style: TextStyle(
                                        color: Color(0xFF222E58),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        // Man image
                        Transform.translate(
                          offset: const Offset(0, -20),
                          child: Image.asset(
                            'assets/images/man_health_risk_assessment.png',
                            width: 240,
                            height: 240,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // White content section
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -40),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // What do you get section
                      const Text(
                        'What do you get?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222E58),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Feature icons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: _FeatureIcon(
                              icon: 'assets/images/key_body_vitals_icon.png',
                              label: 'Key\nBody Vitals',
                            ),
                          ),
                          Expanded(
                            child: _FeatureIcon(
                              icon: 'assets/images/posture_analysis_icon.png',
                              label: 'Posture Analysis',
                            ),
                          ),
                          Expanded(
                            child: _FeatureIcon(
                              icon: 'assets/images/compositio_icon.png',
                              label: 'Body Composition',
                            ),
                          ),
                          Expanded(
                            child: _FeatureIcon(
                              icon: 'assets/images/instant_reports_icon.png',
                              label: 'Instant\nReports',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      // How we do it section
                      const Text(
                        'How we do it?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222E58),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Exercise image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'assets/images/how_we_do_it_image.png',
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Privacy notice
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xFFE8F5E8),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 32,
                              height: 32,
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.shield_outlined,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                'We do not store or share your personal data',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF2E7D32),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Steps list
                      const _StepList(),
                      const SizedBox(height: 30),
                      // Start button
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2E61D3),
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            'Start Assessment',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureIcon extends StatelessWidget {
  final String icon;
  final String label;
  const _FeatureIcon({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xFFE8E9ED)),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Image.asset(
              icon,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color(0xFF222E58),
            height: 1.2,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class _StepList extends StatelessWidget {
  const _StepList();

  @override
  Widget build(BuildContext context) {
    const steps = [
      'Ensure that you are in a well-lit space',
      'Allow camera access and place your device against a stable object or wall',
      'Avoiding wearing baggy clothes',
      'Make sure you exercise as per the instruction provided by the trainer',
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          steps.length,
          (index) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2E61D3),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          steps[index],
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF666666),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ]),
              )),
    );
  }
}
