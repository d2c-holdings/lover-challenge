enum CustomIcons { cat, trash }

extension CustomIconsExtension on CustomIcons {
  String get value {
    switch (this) {
      case CustomIcons.cat:
        return "lib/assets/icons/cat_icon.svg";
      case CustomIcons.trash:
        return "lib/assets/icons/trash_icon.svg";
    }
  }
}
