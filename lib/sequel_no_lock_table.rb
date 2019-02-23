# frozen_string_literal: true

module Sequel
  module Plugins
    module NoLockTable
      # Modify the current model's dataset selection, if the model
      # has a dataset.
      def self.configure(model)
        model.instance_eval do
          self.dataset = dataset if @dataset
        end
      end

      module ClassMethods
        private

        def convert_input_dataset(dts)
          super.nolock
        end
      end
    end
  end
end
