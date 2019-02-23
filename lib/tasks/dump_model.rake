# frozen_string_literal: true

require 'sequel_rails/storage'
require 'yaml'

sequel_rails_namespace = SequelRails::TASK_NAMESPACE

# TODO: DRY these up
namespace sequel_rails_namespace do
  namespace :schema do
    desc 'Create a db/schema.rb file that can be only Model tables portably used against any DB supported by Sequel'
    task dump_models: :environment do
      db_for_current_env.extension :schema_dumper
      filename = ENV['SCHEMA'] || "#{Rails.root}/db/schema.rb"

      tables = YAML.load_file("#{Rails.root}/db/tables_to_dump.yml")
      puts tables.inspect

      File.open filename, 'w' do |file|
        file << "Sequel.migration do\n  change do\n"
        tables['tables'].each do |table|
          file << db_for_current_env.dump_table_schema(Sequel.qualify('dbo', table),
                                                       same_db: false,
                                                       indexes: false,
                                                       schema: 'dbo')

          file << "\n\n"
        end
        file << "  end\nend"
        # file << SequelRails::Migrations.dump_schema_information(:sql => false)
      end
      Rake::Task["#{sequel_rails_namespace}:schema:dump_models"].reenable
    end
  end
end
