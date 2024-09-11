// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homePageHash() => r'f0f19f415046887cdb276219b375737226a8d4c1';

/// See also [HomePage].
@ProviderFor(HomePage)
final homePageProvider = AsyncNotifierProvider<HomePage, List<Game>>.internal(
  HomePage.new,
  name: r'homePageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$homePageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePage = AsyncNotifier<List<Game>>;
String _$homePageTitleHash() => r'cb3fae3c346bcf738e879e3d24e753cd9982c9da';

/// See also [HomePageTitle].
@ProviderFor(HomePageTitle)
final homePageTitleProvider =
    AutoDisposeNotifierProvider<HomePageTitle, String>.internal(
  HomePageTitle.new,
  name: r'homePageTitleProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homePageTitleHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HomePageTitle = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
