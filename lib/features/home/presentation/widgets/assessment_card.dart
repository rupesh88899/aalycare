import 'package:flutter/material.dart';

class AssessmentCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String imageAsset;
  final VoidCallback onTap;

  const AssessmentCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageAsset,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // Image with background
                Container(
                  width: 140,
                  height: title == 'Fitness Assessment'
                      ? 130
                      : 150, // Woman stays 130, man becomes 150
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    gradient: title == 'Fitness Assessment'
                        ? const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            transform: GradientRotation(314.68 * 3.14159 / 180),
                            colors: [
                              Color(0x80E36731), // rgba(227, 103, 49, 0.5)
                              Color(0x80DABE5D), // rgba(218, 190, 93, 0.5)
                            ],
                          )
                        : const RadialGradient(
                            center: Alignment(0.5, 1.22),
                            radius: 1.22,
                            colors: [
                              Color(0x8091B655), // rgba(145, 182, 85, 0.5)
                              Color(0x8069F5BB), // rgba(105, 245, 187, 0.5)
                            ],
                          ),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      imageAsset,
                      width: title == 'Fitness Assessment' ? 120 : 130,
                      height: title == 'Fitness Assessment' ? 110 : 130,
                      fit: title == 'Fitness Assessment'
                          ? BoxFit.contain
                          : BoxFit
                              .cover, // Woman uses contain, man uses cover for zoom
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF222E58),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF2A2A2A),
                          height: 1.4,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 16),
                      // Start button - Circular with play icon and text
                      Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              color: Color(0xFF2E61D3),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              onPressed: onTap,
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Start',
                            style: TextStyle(
                              color: Color(0xFF2E61D3),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
