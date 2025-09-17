class Hero < BaseCharacter
  def initialize(**args)
    args[:name] ||= 'Hero'
    args[:hp]   ||= 120
    args[:mp]   ||= 100

    super(**args)

    @skills['Heal'] = Heal.new
  end
end
