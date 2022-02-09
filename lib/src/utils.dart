import 'package:args/args.dart';
import 'package:nyxx/nyxx.dart';

ArgParser argParser() {
  final parser = ArgParser();
  parser.addOption('dart-env');
  return parser;
}

/// Wrap a string in cyan color to view on console
String cyanStr(String str) {
  return '\x1b[36m$str\x1b[0m';
}

MessageBuilder plainEmbed(String reply) {
  return MessageBuilder.embed(EmbedBuilder()..description = reply);
}
