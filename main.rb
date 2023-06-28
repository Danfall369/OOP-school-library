require_relative 'app'
require_relative 'menu_handler'
require_relative 'user_interface'

@app = App.new
@menu_handler = MenuHandler.new(@app)

def main
  loop do
    @menu_handler.display_menu
    choice = @menu_handler.prompt_choice
    @menu_handler.handle_choice(choice)
    break if choice == 7
  end
end

main
