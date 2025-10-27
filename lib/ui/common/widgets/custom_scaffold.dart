import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/ui/providers/theme_provider.dart';
import 'package:news/ui/resources/designs/design.dart';
import 'package:provider/provider.dart';
import '../../home_screen/home_screen.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final List<Widget> actions;
  final Widget body;

  const CustomScaffold({
    super.key,
    required this.title,
    required this.actions,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    final isDark = themeProvider.isDarkMode;

    return Scaffold(
      appBar: AppBar(title: Text(title), centerTitle: true, actions: actions),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.7,
        backgroundColor: isDark ? AppColors.dark : AppColors.light,
        child: Column(
          children: [
            const DrawerHeader(child: Center(child: Text("News App"))),

            // 🏠 Go To Home
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
    },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.homeIcon,
                      width: 24,
                      colorFilter: ColorFilter.mode(
                        isDark ? AppColors.light : AppColors.dark,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Go To Home",
                      style: GoogleFonts.inter(
                        color: isDark ? AppColors.light : AppColors.dark,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.themeIcon,
                    width: 26,
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.light : AppColors.dark,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Theme",
                    style: GoogleFonts.inter(
                      color: isDark ? AppColors.light : AppColors.dark,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            Container(
              width: 237,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.dark : AppColors.light,
                border: Border.all(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: isDark ? AppColors.dark : AppColors.light,
                  value: isDark ? "Dark" : "Light",
                  items: [
                    DropdownMenuItem(
                      value: "Light",
                      child: Text(
                        "Light",
                        style: TextStyle(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Dark",
                      child: Text(
                        "Dark",
                        style: TextStyle(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    if (value == "Light") {
                      themeProvider.setThemeMode(ThemeMode.light);
                    } else {
                      themeProvider.setThemeMode(ThemeMode.dark);
                    }
                  },
                ),
              ),
            ),

            const SizedBox(height: 25),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Divider(),
            ),
            const SizedBox(height: 25),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppImages.languageIcon,
                    width: 24,
                    colorFilter: ColorFilter.mode(
                      isDark ? AppColors.light : AppColors.dark,
                      BlendMode.srcIn,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Language",
                    style: TextStyle(
                      color: isDark ? AppColors.light : AppColors.dark,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Container(
              width: 237,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: isDark ? AppColors.dark : AppColors.light,
                border: Border.all(
                  color: isDark ? AppColors.light : AppColors.dark,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: isDark ? AppColors.dark : AppColors.light,
                  value: "English",
                  items: [
                    DropdownMenuItem(
                      value: "English",
                      child: Text(
                        "English",
                        style: TextStyle(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "Arabic",
                      child: Text(
                        "Arabic",
                        style: TextStyle(
                          color: isDark ? AppColors.light : AppColors.dark,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
            ),
          ],
        ),
      ),
      body: body,
    );
  }
}
