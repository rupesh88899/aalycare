import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'widgets/assessment_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Hello Jane', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: const Color(0xFF2E61D3), fontWeight: FontWeight.w700)),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(color: const Color(0xFFF1F3FA), borderRadius: BorderRadius.circular(28)),
                    child: TabBar(
                      controller: tabController,
                      indicator: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
                      labelColor: const Color(0xFF2E61D3),
                      unselectedLabelColor: const Color(0xFF6B7280),
                      tabs: const [Tab(text: 'My Assessments'), Tab(text: 'My Appointments')],
                    ),
                  ),
                ]),
              ),
            ),
          ],
          body: TabBarView(
            controller: tabController,
            children: const [
              _AssessmentsTab(),
              _AppointmentsTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssessmentsTab extends StatelessWidget {
  const _AssessmentsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        AssessmentCard(
          title: 'Fitness Assessment',
          subtitle: 'Get started on your fitness goals with our physical assessment and vital scan',
          imageAsset: 'assets/images/women_fitness_assessment.png',
          onTap: () => context.push('/assessment/1'),
        ),
        const SizedBox(height: 16),
        AssessmentCard(
          title: 'Health Risk Assessment',
          subtitle: 'Identify and mitigate health risks with precise, proactive assessments',
          imageAsset: 'assets/images/man_health_risk_assessment.png',
          onTap: () => context.push('/assessment/2'),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: FilledButton(onPressed: () {}, child: const Text('View all')),
        ),
        const SizedBox(height: 8),
        Text('Challenges', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _ChallengeCard(),
        const SizedBox(height: 12),
        Text('Workout Routines', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _WorkoutCard(),
      ],
    );
  }
}

class _AppointmentsTab extends StatelessWidget {
  const _AppointmentsTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      children: [
        Row(children: const [Expanded(child: _AppointmentTile(title: 'Cancer 2nd Opinion', color: Color(0xFFDCE8FF))), SizedBox(width: 12), Expanded(child: _AppointmentTile(title: 'Physiotherapy Appointment', color: Color(0xFFEAD9FF)))]),
        const SizedBox(height: 12),
        const _AppointmentTile(title: 'Fitness Appointment', color: Color(0xFFFFE1D5)),
        const SizedBox(height: 12),
        Center(child: FilledButton(onPressed: null, child: Text('View all'))),
        const SizedBox(height: 20),
        Text('Challenges', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _ChallengeCard(),
        const SizedBox(height: 12),
        Text('Workout Routines', style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 12),
        _WorkoutCard(),
      ],
    );
  }
}

class _AppointmentTile extends StatelessWidget {
  final String title;
  final Color color;
  const _AppointmentTile({required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(16),
      child: Text(title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
    );
  }
}

class _ChallengeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: const Color(0xFFD2F0DF), borderRadius: BorderRadius.circular(24)),
      padding: const EdgeInsets.all(16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text("Today's Challenge!", style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Chip(label: const Text('Push Up 20x'), backgroundColor: Colors.white),
        const SizedBox(height: 8),
        LinearProgressIndicator(value: 0.5, minHeight: 8, borderRadius: BorderRadius.circular(12), backgroundColor: Colors.white),
        const SizedBox(height: 8),
        FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.play_arrow), label: const Text('Continue')),
      ]),
    );
  }
}

class _WorkoutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: const [BoxShadow(color: Color(0x11000000), blurRadius: 8)]),
      padding: const EdgeInsets.all(16),
      child: Row(children: [
        ClipRRect(borderRadius: BorderRadius.circular(16), child: Image.asset('assets/images/women_sweat_starter_card_image.png', width: 110, height: 90, fit: BoxFit.cover)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Sweat Starter', style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: 4),
            const Text('Full Body'),
            const SizedBox(height: 8),
            Row(children: [Chip(label: const Text('Lose Weight')), const SizedBox(width: 8), Text('Difficulty : ', style: Theme.of(context).textTheme.bodySmall), const Text('Medium', style: TextStyle(color: Color(0xFFE05686)))]),
          ]),
        ),
      ]),
    );
  }
}


