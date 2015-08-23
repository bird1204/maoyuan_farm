namespace :db do
  desc "把資料清空"
  task clear_data: :environment do
    ActiveRecord::Base.connection.tables.each do |table|
      p "drop #{table}"
      ActiveRecord::Migration.drop_table table.to_sym, if_exists: true
    end
  end

  desc "rebuild table"
  task rebuild_table: [:clear_data, "db:migrate", "db:seed"]
end
