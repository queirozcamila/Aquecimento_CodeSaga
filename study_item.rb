require_relative 'category'
require 'sqlite3'

class StudyItem
attr_accessor :title, :category

	def initialize(title:, category: Category.new)
		@title = title
		@category = category
	end

	def save_to_db
		db = SQLite3::Database.open "db/database.db"
		db.execute "INSERT INTO study_itens VALUES('#{ title }', '#{ category }')"
		db.close
		self
	end

	def show_all

	end

end
