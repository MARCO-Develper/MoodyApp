import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoodyHomePage extends StatelessWidget {
  const MoodyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo_moody.png"),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  const ImageIcon(
                    AssetImage("assets/images/bell_1.png"),
                    size: 24,
                    color: Colors.black,
                  ),
                  Positioned(
                    top: -0.1,
                    right: -0.1,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Ellipse 2.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Hello, ",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        color: const Color(0xff2E2E5D),
                      ),
                    ),
                    TextSpan(
                      text: "Sara Rose",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff371B34),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'How are you feeling today?',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff371B34),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMoodIcon(
                    "assets/images/love.png",
                    'Love',
                  ),
                  _buildMoodIcon(
                    "assets/images/cool.png",
                    'Cool',
                  ),
                  _buildMoodIcon(
                    "assets/images/happy.png",
                    'Happy',
                  ),
                  _buildMoodIcon(
                    "assets/images/sad.png",
                    'Sad',
                  ),
                ],
              ),
              const SizedBox(height: 32),
              _buildSectionTitle('Feature', onSeeMore: () {}),
              const SizedBox(height: 16),
              _buildFeatureCard(),
              const SizedBox(height: 40),
              _buildSectionTitle('Exercise', onSeeMore: () {}),
              const SizedBox(height: 16),
              _buildExerciseGrid(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (index) {},
        selectedItemColor: const Color(0xff027A48),
        unselectedItemColor: const Color(0xff667085),
        items: const [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                ImageIcon(AssetImage("assets/images/Home.png")),
                SizedBox(height: 4),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Color(0xff027A48),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                ImageIcon(AssetImage("assets/images/grid.png")),
                SizedBox(height: 4),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                ImageIcon(AssetImage("assets/images/calendar.png")),
                SizedBox(height: 4),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                ImageIcon(AssetImage("assets/images/user.png")),
                SizedBox(height: 4),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  Widget _buildMoodIcon(String imagePath, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 32,
          child: Image.asset(
            imagePath,
            height: 50,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: const Color(0xff000000),
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onSeeMore}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: const Color(0xff000000),
          ),
        ),
        GestureDetector(
          onTap: onSeeMore,
          child: Text(
            'See more',
            style: GoogleFonts.inter(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: const Color(0xff027A48),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureCard() {
    final PageController pageController = PageController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 168,
          child: PageView(
            controller: pageController,
            children: [
              _buildFeaturePage(
                title: 'Positive vibes',
                description: 'Boost your mood with \npositive vibes',
                color: const Color(0xffECFDF3),
              ),
              _buildFeaturePage(
                title: 'Stay Focused',
                description: 'Improve your focus and\n productivity',
                color: const Color(0xffFFF3E0),
              ),
              _buildFeaturePage(
                title: 'Feel Relaxed',
                description: 'Unwind and reduce\n stress',
                color: const Color(0xffE3F2FD),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Center(
          child: SmoothPageIndicator(
            controller: pageController,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xff98A2B3),
              dotColor: Color(0xffD9D9D9),
              dotHeight: 6,
              dotWidth: 4,
              expansionFactor: 2,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturePage({
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff344054),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff000000),
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.play_circle_fill,
                    size: 28,
                    color: Color(0xff4CAF50),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "10 mins",
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff000000),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(width: 16),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Walking the Dog.png",
                  width: 102,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExerciseGrid() {
    final exercises = [
      {
        'label': 'Relaxation',
        'icon': 'assets/images/relaxation.png',
        'color': const Color(0xffE8F5E9)
      },
      {
        'label': 'Meditation',
        'icon': 'assets/images/meditation.png',
        'color': const Color(0xffFCE4EC)
      },
      {
        'label': 'Breathing',
        'icon': 'assets/images/beathing.png',
        'color': const Color(0xffFFF3E0)
      },
      {
        'label': 'Yoga',
        'icon': 'assets/images/yoga.png',
        'color': const Color(0xffE3F2FD)
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3,
      ),
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        final exercise = exercises[index];
        return Container(
          decoration: BoxDecoration(
            color: exercise['color'] as Color,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                exercise['icon'] as String,
                width: 24,
                height: 24,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 8),
              Text(
                exercise['label'] as String,
                style: GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xff000000),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
