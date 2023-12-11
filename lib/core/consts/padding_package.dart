enum PaddingPackage {
  xsmall,
  small,
  medium,
  large,
  xlarge,
}

extension PaddingPackageExtension on PaddingPackage {
  double get value {
    switch (this) {
      case PaddingPackage.xsmall:
        return 4;
      case PaddingPackage.small:
        return 8;
      case PaddingPackage.medium:
        return 12;
      case PaddingPackage.large:
        return 16;
      case PaddingPackage.xlarge:
        return 20;
    }
  }
}
