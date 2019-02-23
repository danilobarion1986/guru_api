Sequel.migration do
  change do
    create_table(Sequel::SQL::QualifiedIdentifier.new("dbo", :"status")) do
      primary_key :id
      String :status
      TrueClass :excluido, :default=>false, :null=>false
    end

    create_table(Sequel::SQL::QualifiedIdentifier.new("dbo", :funcionarios)) do
      primary_key :id
      String :nome, :null=>false
      String :email
      foreign_key :status_id, :status, :default=>1, :key => :id, :null=>false
      TrueClass :excluido, :default=>false, :null=>false
    end
  end
end
