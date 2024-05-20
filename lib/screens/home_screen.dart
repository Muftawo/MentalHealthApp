import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/common/mh_icon_container.dart';
import 'package:mentalhealthapp/utils/constants/colors.dart';
import 'package:mentalhealthapp/utils/constants/sizes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MhColors.primary,
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: [
              GreetingsRow(),
              SizedBox(height: MhSizes.spaceBtwItems),
              SearchBar(),
              SizedBox(height: MhSizes.spaceBtwItems),
              Feelings(),
              SizedBox(height: MhSizes.spaceBtwItems),
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
              EmojiContainer(
                containerColor: MhColors.secondary,
                emoji: '😔',
              ),
              EmojiContainer(
                containerColor: MhColors.secondary,
                emoji: '😊',
              ),
              EmojiContainer(
                containerColor: MhColors.secondary,
                emoji: '😁',
              ),
              EmojiContainer(
                containerColor: MhColors.secondary,
                emoji: '😃',
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
