import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';

import '../../../../app/routes/app_route.gr.dart';
import '../../../../core/common/color_utils.dart';
import '../../../../theme/color_palette.dart';
import '../../../../utils/ui/app_horizontal_divider.dart';
import '../providers/search_provider.dart';

@RoutePage()
class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);

    return FocusScaffold(
      appBar: DefaultAppBar(title: "Search"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: TextField(
              autofocus: true,
              cursorColor: Theme.of(context).colorScheme.onSurface,
              onChanged: (value) {
                print("value change");
                ref.read(searchProvider.notifier).search(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Theme.of(context).colorScheme.surface,
                hintText: "Search Subject...",
                prefixIcon: Icon(
                  Icons.search,
                  // color: isDark
                  //     ? ColorPalette.outlineDark
                  //     : ColorPalette.primary,
                ),
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 15),
              ),
            ),
          ),
          if (state.isEmpty)
            Center(child: Text('No subjects found'))
          else
            Expanded(
              child: SingleChildScrollView(
                child: ListView.separated(
                  itemCount: state.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final subject = state[index];
                    Color subjectColor = subject.color == null
                        ? Colors.blue
                        : hexToColor(subject.color!);
                    return ListTile(
                      minTileHeight: 80,
                      titleAlignment: ListTileTitleAlignment.center,
                      leading: subject.icon != null
                          ? Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: subjectColor.withAlpha(50),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: SvgPicture.string(
                                subject.icon!,
                                height: 40,
                                width: 40,
                                fit: BoxFit.contain,
                                colorFilter: ColorFilter.mode(
                                  subjectColor,
                                  BlendMode.srcIn,
                                ),
                              ),
                            )
                          : null,
                      onTap: () {
                        print("clicked");
                        context.router.push(QuestionsRoute(subject: subject));
                      },
                      title: Text(
                        subject.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        '4 years questions',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return AppHorizontalDivider(color: ColorPalette.disabled);
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
