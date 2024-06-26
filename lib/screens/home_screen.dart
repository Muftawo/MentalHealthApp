import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:mentalhealthapp/utils/common/mh_icon_container.dart';
import 'package:mentalhealthapp/utils/constants/colors.dart';
import 'package:mentalhealthapp/utils/constants/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MhColors.primary,
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   elevation: 0,
      //   backgroundColor: MhColors.secondary,
      //   child: const Icon(Icons.add),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[300],
        // iconSize: 20.0,
        // selectedFontSize: 20.0,
        onTap: (index) {
          setState(
            () {
              _currentIndex = index;
            },
          );
        },
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.grid_view_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.email_rounded), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const GreetingsRow(),
              const SizedBox(height: MhSizes.spaceBtwItems),
              SearchBar(
                searchController: searchController,
              ),
              const SizedBox(height: MhSizes.spaceBtwItems),
              const Feelings(),
              const SizedBox(height: MhSizes.spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}

class Feelings extends StatelessWidget {
  const Feelings({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "How do you feel ?",
                style: TextStyle(
                    color: MhColors.textPrimary,
                    fontSize: MhSizes.fontSizeMedium,
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.more_horiz,
                color: MhColors.iconPrimary,
              )
            ],
          ),
          const SizedBox(
            height: MhSizes.spaceBtwItems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FeelingEmojiTile(
                containerColor: MhColors.secondary,
                emoji: '😔',
                feelingText: "Bad",
              ),
              FeelingEmojiTile(
                containerColor: MhColors.secondary,
                emoji: '😊',
                feelingText: "Fine",
              ),
              FeelingEmojiTile(
                containerColor: MhColors.secondary,
                emoji: '😃',
                feelingText: "Well",
              ),
              FeelingEmojiTile(
                containerColor: MhColors.secondary,
                emoji: '🥳',
                feelingText: "Execelent",
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: MhColors.secondary, borderRadius: BorderRadius.circular(16)),
      child: TextFormField(
        textAlign: TextAlign.justify,
        controller: searchController,
        decoration: const InputDecoration(
          hintText: "Search",
          hintStyle: TextStyle(color: MhColors.textPrimary),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: MhColors.textPrimary,
          ),
        ),
        style: const TextStyle(color: MhColors.textPrimary),
        onChanged: (value) {},
      ),
    );
  }
}

class GreetingsRow extends StatelessWidget {
  const GreetingsRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now().toLocal();
    String formattedDate = DateFormat('dd MMM yyyy').format(now);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Hi, Mufti!",
              style: TextStyle(
                  color: MhColors.textPrimary,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              formattedDate,
              style: TextStyle(color: MhColors.textSecondary, fontSize: 10),
            )
          ],
        ),
        MhIconContainer(
          containerColor: MhColors.secondary,
          icon: Icons.notifications,
          iconColor: MhColors.iconPrimary,
        )
      ],
    );
  }
}
