require_relative 'category'
require 'sqlite3'

class StudyItem
attr_accessor :title, :category

	def initialize(title:, category: Category.new)
		@title = title
		@category = category
	end
end
