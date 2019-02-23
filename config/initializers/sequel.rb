# frozen_string_literal: true

require 'sequel'

Sequel::Model.db.extension(:asterisk_hunter)
Sequel::Model.db.extension(:pagination)

action = -> { Rails.logger.warn("Find 'SELECT *' in query!") }
Sequel::Extensions::AsteriskHunter.define_action(action)
