import 'package:nyxx_interactions/nyxx_interactions.dart';

class CommandException implements Exception {
  /// This string will be the reply to command
  final String message;

  CommandException({this.message = ''});
}

/*
 * Global check
 */

bool _isGuild(ISlashCommandInteractionEvent event) {
  if (event.interaction.guild == null) {
    return false;
  } else {
    return true;
  }
}

/// Check that apply to all commands
///
/// Set `guildCheck` to false to disable guild only command check
Future<void> globalCommandCheck(ISlashCommandInteractionEvent event,
    {bool guildCheck = true, bool isPremium = false}) async {
  // check list
  if (guildCheck) {
    if (!_isGuild(event)) {
      throw CommandException(message: 'This command is guild only');
    }
  }
}
