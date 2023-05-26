/// env.json file
/// use `--dart-define-from-file=env.json`
abstract class Env {
  const Env._();

  static const sentryDsn = String.fromEnvironment('sentry_dsn');
}
