require_relative 'keypress'
require 'colorize'

module GiveOptions
  extend self

  def select_from_array(array:)
    pointer = 0

    loop do
      display_options(array, pointer)
      input = Keypress.get_arrows_input
      return pointer if input == 'RETURN'

      if ['LEFT', 'DOWN'].include?(input) # move pointer leftwards
        pointer == 0 ? pointer = array.count() -1 : pointer -= 1
      elsif ['RIGHT', 'UP'].include?(input) # move pointer rightwards
        pointer == array.count() -1 ? pointer = 0 : pointer += 1
      elsif input == 'ESCAPE'
        return "ESCAPE"
      end
    end

    pointer
  end

  private

  def display_options(array, pointer)
    str = ''
    array.each_with_index do |option, i|
      if i == pointer
        str += option.blue + "  "
      else
        str += option + "  "
      end
    end

    print str + "\r"
  end
end

# puts GiveOptions.select_from_array(array: ['option1', 'option2', 'option3'])