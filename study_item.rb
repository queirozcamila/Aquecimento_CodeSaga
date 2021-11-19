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

	def self.show_all
		db = SQLite3::Database.open "db/database.db"
		db.results_as_hash = true
		study_itens = db.execute "SELECT title, category FROM study_itens"
		db.close
		study_itens.map { |item|
		puts " - Título: " + item['title'] + " / Categoria: " + item['category'] }
		self
	end

	def self.search(search_wd)
		db = SQLite3::Database.open "db/database.db"
		db.results_as_hash = true
		study_itens = db.execute "SELECT * FROM study_itens WHERE category LIKE '%#{search_wd}%' OR title LIKE '%#{search_wd}%'"
		db.close
		study_itens.map { |item|
		puts " - Título: " + item['title'] + " / Categoria: " + item['category']}
		self
	end

end
