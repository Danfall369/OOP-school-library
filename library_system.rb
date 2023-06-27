class LibrarySystem
  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit_program
  }.freeze

  def initialize
    @app = App.new
  end

  def start
    loop do
      display_menu
      choice = prompt_choice
      handle_choice(choice)
      break if choice == 7
    end
  end

  private

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

  def handle_choice(choice)
    if OPTIONS.key?(choice)
      send(OPTIONS[choice])
      puts "\n"
    else
      invalid_choice
    end
  end

  def list_all_books
    @app.list_all_books
  end

  def list_all_people
    @app.list_all_people
  end

  def create_person
    # Code for creating a person
  end

  def create_book
    # Code for creating a book
  end

  def create_rental
    # Code for creating a rental
  end

  def list_rentals_for_person
    # Code for listing rentals for a person
  end

  def exit_program
    puts 'Thank you for using the OPP Library System. See ya!'
  end

  def invalid_choice
    puts 'Invalid choice. Please try again.'
  end
end
