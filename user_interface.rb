class UserInterface
  def display_menu
    puts 'Please select an option:'
    puts '1. List all books'
    puts '2. List all people'
    puts '3. Create a person'
    puts '4. Create a book'
    puts '5. Create a rental'
    puts '6. List all rentals for a person'
    puts '7. Quit'
  end

  def prompt_choice
    print 'Enter your choice (1-7): '
    gets.chomp.to_i
  end

  def display_success(message)
    puts message
  end

  def display_error(message)
    puts "Error: #{message}"
  end

  def display_list(title, items)
    if items.empty?
      puts "#{title}: Empty list"
    else
      puts "#{title}:"
      items.each { |item| puts item }
    end
  end
end
