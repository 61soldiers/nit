import 'package:nyxx/nyxx.dart';
import 'package:nyxx_interactions/nyxx_interactions.dart';

import '../utils.dart';

/// Command that replies with bot latency
Future<void> ping(ISlashCommandInteractionEvent event) async {
  var latency = 0;
  if (event.interaction.guild != null) {
    latency = (event.client as INyxxWebsocket)
        .shardManager
        .shards
        .firstWhere(
            (shard) => shard.guilds.contains(event.interaction.guild!.id))
        .gatewayLatency
        .inMilliseconds;
  } else {
    latency = (event.client as INyxxWebsocket)
        .shardManager
        .shards
        .first
        .gatewayLatency
        .inMilliseconds;
  }

  await event.respond(plainEmbed('**$latency**ms'));
}
