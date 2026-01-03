import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:question_hub/features/bookmark/presentation/pages/bookmark_tab_view.dart';
import 'package:question_hub/features/bookmark/presentation/pages/doubt_tab_view.dart';
import 'package:question_hub/features/bookmark/presentation/providers/library_provider.dart';
import 'package:question_hub/theme/color_palette.dart';
import 'package:question_hub/utils/ui/default_app_bar.dart';
import 'package:question_hub/utils/ui/focus_scaffold.dart';

import '../providers/doubt_provider.dart';

@RoutePage()
class BookmarkPage extends ConsumerStatefulWidget {
  const BookmarkPage({super.key});

  @override
  ConsumerState<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends ConsumerState<BookmarkPage>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    _tabController.addListener(() {
      ref
          .read(libraryProvider.notifier)
          .update((_) => _tabController.index == 0);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FocusScaffold(
      appBar: DefaultAppBar(
        title: "Your Library",
        toolbarHeight: 110,
        bottom: TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          labelColor: ColorPalette.white,
          indicatorColor: ColorPalette.white,
          indicatorPadding: EdgeInsetsGeometry.symmetric(horizontal: 8),
          tabs: [
            Tab(icon: Icon(Icons.question_mark), text: "Doubts"),
            Tab(icon: Icon(Icons.bookmark_add_outlined), text: "Bookmarked"),
          ],
        ),
        action: ref.watch(libraryProvider)
            ? IconButton(
                icon: Icon(Icons.check_circle_outline),
                onPressed: () {
                  final doubts = ref.read(doubtQuestionStreamProvider).value;

                  final solvedDoubts = doubts?.where(
                    (doubt) => doubt.isSolved == true,
                  );

                  if (solvedDoubts == null || solvedDoubts.isEmpty) {
                    log("no solved question. return");
                    return;
                  }

                  ref.read(doubtProvider.notifier).clearSolvedDoubt(context);
                },
              )
            : null,
      ),
      body: TabBarView(
        controller: _tabController,
        children: [DoubtTabView(), BookmarkTabView()],
      ),
    );
  }
}
