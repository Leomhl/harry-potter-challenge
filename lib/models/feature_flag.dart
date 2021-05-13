class FeatureFlag{
  bool active;
  FeatureFlag(this.active);
  @override
  String toString() {
    return 'Features {active: $active }';
  }
}