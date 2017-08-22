class Backpack
  def initialize(attributes)
    @attributes = attributes # a hash containing day_of_week and weather keys
    @items = []
    prepare
  end

  def items
    @items
  end

  def prepare

    add_items_to_backpack
    # Ensure gym shoes are added to backpack if it's a gym day
    check_if_gym_day

    pack_lunch

  end

  def check_if_gym_day
    # Gotta get to the gym on Mondays and Wednesdays.
    day_of_week = @attributes[:day_of_week]
    if day_of_week == 'monday' || day_of_week == 'thursday'
      #add gym shoes to items
      @items << 'gym shoes'
    end
  end

  def pack_lunch
    # Bring a packed lunch on all weekdays
    day_of_week = @attributes[:day_of_week]
    if day_of_week != 'saturday' && day_of_week != 'sunday'
      @items << 'packed lunch'
    else
      # only need snacks
      @items << 'snacks'
    end
  end
    # set up local variables used by rest of prepare method

  def add_items_to_backpack
    weather = @attributes[:weather]
    # Ensure weather-appropriate items are added to backpack
    if weather == 'rainy'
      @items << 'pants'
      @items << 'shirt'
      @items << 'umbrella'
    elsif weather == 'cold'
      @items << 'pants'
      @items << 'shirt'
      @items << 'jacket'
    else
      @items << 'pants'
      @items << 'shirt'
    end
  end






  # Prints a summary packing list for Melinda's backpack
  def print_list
    output = []
    output << "Melinda, here's your packing list!"
    output << "Day: #{@attributes[:day_of_week]}, Weather: #{@attributes[:weather]}"
    output << ""

    @items.each do |item|
      output << "- #{item}"
    end
    output.join("\n")
  end

end
