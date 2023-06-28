require_relative 'app'

class MenuHandler
  def initialize(app)
    @app = app
  end

  OPTIONS = {
    1 => :list_all_books,
    2 => :list_all_people,
    3 => :create_person,
    4 => :create_book,
    5 => :create_rental,
    6 => :list_rentals_for_person,
    7 => :exit_program
  }.freeze

  def main
    loop do
      display_menu
      choice = prompt_choice
      handle_choice(choice)
      break if choice == 7
    end
  end

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

  def list_all_people_index
    @app.list_all_people.each_with_index do |person, index|
      puts "#{index + 1}) #{person.name}, Age: #{person.age}"
    end
  end

  def list_all_books_index
    @app.list_all_books.each_with_index do |book, index|
      puts "#{index + 1}) #{book.title} by #{book.author}"
    end
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [input the number]: '
    type_choice = gets.chomp.to_i

    case type_choice
    when 1
      create_student
    when 2
      create_teacher
    else
      puts 'Invalid person type choice!'
    end
  end

  def create_student
    print 'Enter the student name: '
    name = gets.chomp
    print 'Enter the student age: '
    age = gets.chomp.to_i
    print 'Enter if the student has permission (y/n): '
    has_permission = gets.chomp.downcase == 'y'
    extra_info = { parent_permission: has_permission }
    @app.create_person(name, age, 'student', extra_info)
  end

  def create_teacher
    print 'Enter the teacher name: '
    name = gets.chomp
    print 'Enter the teacher age: '
    age = gets.chomp.to_i
    print 'Enter the teacher specialization: '
    specialization = gets.chomp
    extra_info = { specialization: specialization }
    @app.create_person(name, age, 'teacher', extra_info)
  end

  def create_book
    print 'Enter the book title: '
    title = gets.chomp
    print 'Enter the book author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def create_rental
    puts 'Available Books:'
    list_all_books_index
    print 'Select a book from the list (enter the index): '
    book_index = gets.chomp.to_i - 1

    puts "\nAvailable People:"
    list_all_people_index
    print 'Select a person from the list (enter the index): '
    person_index = gets.chomp.to_i - 1

    print 'Enter the rental date (YYYY-MM-DD): '
    date = gets.chomp

    selected_book = @app.get_book_by_index(book_index)
    selected_person = @app.get_person_by_index(person_index)

    @app.create_rental(selected_book, selected_person, date)
  end

  def list_rentals_for_person
    print 'Enter the person ID: '
    id = gets.chomp.to_i
    @app.list_rentals_for_person_id(id)
  end

  def exit_program
    puts 'Thank you for using the OPP Library System. See ya!'
  end

  def invalid_choice
    puts 'Invalid choice. Please try again.'
  end
end
