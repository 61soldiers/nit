import 'package:nyxx_interactions/nyxx_interactions.dart';

import 'command_checks.dart';
import 'commands/ping.dart';
import 'utils.dart';

final pingCommand =
    SlashCommandBuilder('ping', 'Get bot latency in milliseconds', [])
      ..registerHandler((event) async {
        try {
          // checks
          await globalCommandCheck(event, guildCheck: false);
          // command
          await ping(event);
        } on CommandException catch (e) {
          await event.respond(plainEmbed(e.message));
        } catch (e, trace) {
          await event.respond(plainEmbed('Fatal error!'));
        }
      });
