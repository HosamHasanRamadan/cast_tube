import 'package:cast_tube/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef Reader = T Function<T>(ProviderListenable<T> provider);

/// This Dependency provider for all global `AlwaysAliveProviderBase` type
/// that gives you the ability to read [read,refresh,invalidate]
abstract class DepsContainer {
  static ProviderContainer? _rootContainer;
  static ProviderContainer get rootContainer {
    if (_rootContainer == null) throw StateError('You need to call `init` first');
    return _rootContainer!;
  }

  static void init({
    List<Override> overrides = const [],
    List<ProviderObserver>? observers,
  }) {
    if (_rootContainer != null) 'container is initialized'.log();
    _rootContainer ??= ProviderContainer(
      overrides: overrides,
      observers: observers,
    );
  }

  static void initWithContainer(ProviderContainer container) {
    if (_rootContainer != null) 'container is initialized'.log();
    _rootContainer ??= container;
  }

  static R read<R>(AlwaysAliveProviderBase<R> provider) => rootContainer.read(provider);
  static void refresh<R>(AlwaysAliveProviderBase<R> provider) => rootContainer.refresh(provider);
  static void invalidate<R>(AlwaysAliveProviderBase<R> provider) => rootContainer.invalidate(provider);
  static void invalidateAll() => rootContainer.getAllProviderElements().forEach((provider) {
        provider.invalidateSelf();
      });
}
