import 'package:copado26/core/constants/app_colors.dart';
import 'package:copado26/core/constants/app_constants.dart';
import 'package:copado26/domain/entities/sticker.dart';
import 'package:copado26/presentation/blocs/album/album_bloc.dart';
import 'package:copado26/presentation/widgets/sticker_grid_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistScreen extends StatefulWidget {
  const ChecklistScreen({super.key});

  @override
  State<ChecklistScreen> createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  late String _selectedSection;
  final _sidebarController = ScrollController();

  static final _sections = WorldCup2026Teams.codes.keys.toList()..sort();

  @override
  void initState() {
    super.initState();
    _selectedSection = _sections.first;
  }

  @override
  void dispose() {
    _sidebarController.dispose();
    super.dispose();
  }

  void _selectSection(String section) {
    setState(() => _selectedSection = section);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      builder: (context, state) {
        if (state is AlbumLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is! AlbumDataLoaded) return const SizedBox.shrink();

        final stickers = state.stickers;
        final filtered = stickers
            .where((s) => s.section == _selectedSection)
            .toList()
          ..sort((a, b) => a.number.compareTo(b.number));

        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _TeamSidebar(
              controller: _sidebarController,
              sections: _sections,
              selected: _selectedSection,
              allStickers: stickers,
              onSelected: _selectSection,
            ),
            const VerticalDivider(width: 1, thickness: 1),
            Expanded(
              child: _StickerPanel(
                section: _selectedSection,
                stickers: filtered,
                allStickers: stickers,
              ),
            ),
          ],
        );
      },
    );
  }
}

// ── Left sidebar ──────────────────────────────────────────────────────────────

class _TeamSidebar extends StatelessWidget {
  const _TeamSidebar({
    required this.controller,
    required this.sections,
    required this.selected,
    required this.allStickers,
    required this.onSelected,
  });

  final ScrollController controller;
  final List<String> sections;
  final String selected;
  final List<Sticker> allStickers;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      color: const Color(0xFF1A3A1A),
      child: ListView.builder(
        controller: controller,
        itemCount: sections.length,
        itemExtent: 68,
        itemBuilder: (context, i) {
          final sec = sections[i];
          final secStickers = allStickers.where((s) => s.section == sec);
          final owned = secStickers.where((s) => s.isOwned).length;
          final total = secStickers.length;
          final isComplete = owned == total && total > 0;
          final isSelected = sec == selected;

          return _TeamTile(
            section: sec,
            owned: owned,
            total: total,
            isComplete: isComplete,
            isSelected: isSelected,
            onTap: () => onSelected(sec),
          );
        },
      ),
    );
  }
}

class _TeamTile extends StatelessWidget {
  const _TeamTile({
    required this.section,
    required this.owned,
    required this.total,
    required this.isComplete,
    required this.isSelected,
    required this.onTap,
  });

  final String section;
  final int owned;
  final int total;
  final bool isComplete;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final flag = WorldCup2026Teams.flagOf(section);
    final ratio = total == 0 ? 0.0 : owned / total;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary
              : Colors.transparent,
          border: isSelected
              ? const Border(
                  right: BorderSide(color: AppColors.secondary, width: 3),
                )
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(flag, style: const TextStyle(fontSize: 26)),
            const SizedBox(height: 2),
            Text(
              section,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.white60,
                fontSize: 10,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 4),
            SizedBox(
              width: 40,
              height: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: ratio,
                  backgroundColor: Colors.white12,
                  valueColor: AlwaysStoppedAnimation(
                    isComplete
                        ? AppColors.stickerSpecial
                        : AppColors.stickerOwned,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Right panel ───────────────────────────────────────────────────────────────

class _StickerPanel extends StatelessWidget {
  const _StickerPanel({
    required this.section,
    required this.stickers,
    required this.allStickers,
  });

  final String section;
  final List<Sticker> stickers;
  final List<Sticker> allStickers;

  @override
  Widget build(BuildContext context) {
    final owned = stickers.where((s) => s.isOwned).length;
    final total = stickers.length;
    final ratio = total == 0 ? 0.0 : owned / total;
    final teamName = WorldCup2026Teams.codes[section] ?? section;
    final flag = WorldCup2026Teams.flagOf(section);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PanelHeader(
          flag: flag,
          teamName: teamName,
          owned: owned,
          total: total,
          ratio: ratio,
        ),
        Expanded(
          child: _StickerGrid(stickers: stickers),
        ),
      ],
    );
  }
}

class _PanelHeader extends StatelessWidget {
  const _PanelHeader({
    required this.flag,
    required this.teamName,
    required this.owned,
    required this.total,
    required this.ratio,
  });

  final String flag;
  final String teamName;
  final int owned;
  final int total;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 10, 12, 8),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0xFFE0E0E0))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 22)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  teamName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '$owned/$total',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: LinearProgressIndicator(
              value: ratio,
              minHeight: 6,
              backgroundColor: AppColors.stickerMissing.withValues(alpha: 0.25),
              valueColor: AlwaysStoppedAnimation(
                ratio >= 1.0 ? AppColors.stickerSpecial : AppColors.stickerOwned,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StickerGrid extends StatelessWidget {
  const _StickerGrid({required this.stickers});

  final List<Sticker> stickers;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        crossAxisSpacing: 6,
        mainAxisSpacing: 6,
      ),
      itemCount: stickers.length,
      itemBuilder: (context, i) => StickerGridTile(sticker: stickers[i]),
    );
  }
}
