import 'package:flutter/material.dart';

import '../app_identity.dart';

/// AppBar yang selalu menampilkan judul halaman beserta identitas diri.
///
/// Dipakai di seluruh halaman agar setiap hasil dokumentasi mudah dikenali.
class IdentityAppBar extends StatelessWidget implements PreferredSizeWidget {
  const IdentityAppBar({
    super.key,
    required this.title,
    this.bottom,
    this.actions,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.toolbarHeight = 72,
  });

  final String title;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final double toolbarHeight;

  @override
  Size get preferredSize =>
      Size.fromHeight(toolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: toolbarHeight,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      bottom: bottom,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 2),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.badge_outlined, size: 13, color: Colors.white70),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  AppIdentity.display,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 11.5, color: Colors.white70),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
