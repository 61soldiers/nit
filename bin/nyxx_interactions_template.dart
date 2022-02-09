import 'dart:convert';
import 'dart:io';

import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';
import 'package:nyxx_interactions_template/export.dart';
import 'package:path/path.dart' as path;
import 'package:yaml/yaml.dart';

Future<void> main(List<String> args) async {
  final parsedArgs = argParser().parse(args);
  Globals.isDev = parsedArgs['dart-env'] == 'dev';

  final confPath = path.join(path.current, 'confidential.yaml');
  final dynamic readConfJson =
      loadYaml(await File(confPath).readAsString(encoding: utf8));
  final confidential = Confidential.fromJson(readConfJson);

  final bot = NyxxFactory.createNyxxWebsocket(
      confidential.botToken, GatewayIntents.allUnprivileged)
    ..registerPlugin(Logging())
    ..registerPlugin(CliIntegration())
    ..registerPlugin(IgnoreExceptions());
  await bot.connect();

  print(cyanStr('in development?: ${Globals.isDev}'));

  IInteractions.create(WebsocketInteractionBackend(bot))
    ..registerSlashCommand(pingCommand)
    ..syncOnReady();
}
