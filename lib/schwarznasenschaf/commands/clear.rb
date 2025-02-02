# frozen_string_literal: true

module Schwarznasenschaf
  module Commands
    module Clear
      extend Discordrb::Commands::CommandContainer

      command_attributes = {
        description: 'Clears the last [x] messages from the channel',
        help_available: true,
        max_args: 1,
        min_args: 1,
        rescue: 'An  error occured while trying to execute this command.',
        required_roles: [Support::Config::ROLES[:mod_team]],
        usage: 'clear [number]'
      }

      command :clear, command_attributes do |event, num_to_delete|
        result = Commands.bulk_delete event.channel, num_to_delete.to_i
        Commands.send_and_delete event.channel, result
      end
    end
  end
end
