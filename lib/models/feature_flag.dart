class FeatureFlag{
  String feature;
  bool active;

  FeatureFlag({this.feature,this.active});
  @override
  String toString() {
    return 'Features {feature: $feature ,active: $active }';
  }
}