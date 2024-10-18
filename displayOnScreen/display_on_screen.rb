require_relative '../giveOptions/give_options'
require_relative '../characters/index'

module DisplayOnScreen
  extend self

  def box( 
    values: {
      row1: ["test heading", :center],
      row2: ["test subtext"]
    },
    length: 30
  )
    puts "-" * length
    values.each do |_key, row|
      check_row_type(row, length)

      row.each do |value|
        print value + "   " if value.is_a?(String)
      end
      puts ""
    end
    puts "-" * length
  end

  private

  def check_row_type(row, length)
    properties = row.select {|value| value.is_a?(Symbol)}

    print " " * (length/4) if properties.include?(:center)
  end
end

# DisplayOnScreen.box(values: {row1: ["name", :center], row2: ["hp: 100", "mp: 100", "stamina: 50"], row3: []})