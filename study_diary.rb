require_relative 'study_item'

puts " ------- Seja Bem-vindo --------
[1] Cadastrar um item para estudar
[2] Ver todos os itens cadastrados
[3] Buscar um item de estudo
[4] Sair
Escolha uma opção:"
opcao = gets.chomp

if  (opcao > "0" && opcao < "5")
	while(opcao != 4)
		if opcao == "1"
			puts "Qual o título do novo item?"
			title = gets.chomp
			puts "Qual a categoria do item?"
			category = gets.chomp
			item = StudyItem.new(title: title, category: category)
			puts "Novo item cadastrado com sucesso!"
			puts "Título: " + item.title
			puts "Categoria: " + item.category
			item.save_to_db
		elsif opcao == "2"
			StudyItem.show_all
		elsif opcao == "3"
			puts "Insira uma palavra para busca:"
			search_wd = gets.chomp
			StudyItem.search(search_wd)
		else opcao == "4"
			break
		end
		puts "Escolha outra opção"
		opcao = gets.chomp
		system('clear')
	end
else
	puts("Opção inválida")
end
