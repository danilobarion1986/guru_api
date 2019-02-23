# frozen_string_literal: true

require 'sequel'

Sequel::Model.db.extension(:asterisk_hunter)
Sequel::Model.db.extension(:pagination)

action = -> do
  Rails.logger.info('***AsteriskHunter***')
  Rails.logger.info("Find 'SELECT *' in query!")
end

Sequel::Extensions::AsteriskHunter.define_action(action)
