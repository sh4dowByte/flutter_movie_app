import 'package:flutter/material.dart';
import 'package:flutter_movie_app/core/pallete.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/adult_notifier.dart';
import 'package:flutter_movie_app/features/settings/presentation/notifiers/language_notifier.dart';
import 'package:flutter_movie_app/widget/app_icons8.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widget/app_svg_icon.dart';
import '../notifiers/theme_notifier.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeNotifier = ref.read(themeProvider.notifier);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    final isAdult = ref.watch(isAdultProvider);
    final isAdultNotifier = ref.read(isAdultProvider.notifier);

    final currentLanguage = ref.watch(languageProvider);
    final languageNotifier = ref.read(languageProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Settings'),
      ),
      body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          children: [
            AppMenuTile(
              title: 'Language',
              icon: 'language',
              leading: InkWell(
                splashColor: Colors.transparent,
                hoverColor: Colors.transparent,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (BuildContext context) {
                      return ChoseLanguageComponent(
                        onSelect: (lang) {
                          languageNotifier.changeLanguage(lang);

                          Navigator.pop(context);
                        },
                      );
                    },
                  );
                },
                child: Row(
                  children: [
                    ChoseLanguageComponent.getLabel(context, currentLanguage),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 16,
                    )
                  ],
                ),
              ),
            ),
            AppMenuTile(
              title: 'Dark Mode',
              icon: 'theme',
              leading: Switch(
                value: isDarkMode,
                onChanged: (value) => themeNotifier.toggleTheme(),
              ),
            ),
            AppMenuTile(
              title: 'Show adult content',
              icon: 'adult',
              leading: Switch(
                value: isAdult,
                onChanged: (value) => isAdultNotifier.toggleIsAdult(),
              ),
            ),
          ]),
    );
  }
}

class AppMenuTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final String? icon;
  const AppMenuTile({
    super.key,
    this.leading,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) ...[
                AppSvgIcon(icon!, color: Theme.of(context).iconTheme.color),
                const SizedBox(width: 16),
              ],
              Text(title),
            ],
          ),
          leading ??
              Icon(
                Icons.arrow_forward_ios_rounded,
                color: Pallete.textSecondary.withOpacity(0.4),
                size: 16,
              )
        ],
      ),
    );
  }
}

class ChoseLanguageComponent extends StatelessWidget {
  final Function(String)? onSelect;
  const ChoseLanguageComponent({
    super.key,
    this.onSelect,
  });

  static List<Map<dynamic, String>> language = [
    {
      'lang': 'id-ID',
      'country': 'Indonesia',
      'flag': 'lph_obIfg-jT',
    },
    {
      'lang': 'en-US',
      'country': 'United States',
      'flag': 'kmhygyVC3wiA',
    },
    {
      'lang': 'ja-JP',
      'country': 'Japanese',
      'flag': 'McQbrq9qaQye',
      'info': 'More anime trailers'
    },
    {
      'lang': 'ko-KR',
      'country': 'Korea',
      'flag': '-_RS8ho736Fs',
    },
    {
      'lang': 'ar-SA',
      'country': 'Arabic',
      'flag': 'NA7wq_gDd9d7',
    },
    {
      'lang': 'zh-CN',
      'country': 'Chinese',
      'flag': 'Ej50Oe3crXwF',
    },
    {
      'lang': 'th-TH',
      'country': 'Thailand',
      'flag': 'IWVDTvmUNsig',
    },
    {
      'lang': 'vi-VN',
      'country': 'Vietnam',
      'flag': '2egPD0I7yi4-',
    },
  ];

  static Widget getLabel(BuildContext context, String lang) {
    final item = language.firstWhere(
      (element) => element['lang'] == lang,
      orElse: () => language[0],
    );

    return Row(
      children: [
        // Icon berdasarkan flag
        AppIcons8.getById(
          item['flag'] ?? '',
          width: 25,
          height: 25,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(item['country'] ?? ''),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: language.length,
        itemBuilder: (context, index) {
          final item = language[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
            child: InkWell(
              onTap: () {
                if (onSelect != null) {
                  onSelect!(item['lang']!);
                }
              },
              hoverColor: Colors.transparent,
              child: Row(
                children: [
                  AppIcons8.getById(item['flag'] ?? '', width: 35, height: 35),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item['country']!),
                      Row(
                        children: [
                          Text(
                            item['lang']!,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            item['info'] ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .copyWith(fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
