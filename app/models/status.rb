# frozen_string_literal: true

class Status < Sequel::Model(:status)
  include ActiveModel::Serialization
end
