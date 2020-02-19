class Waiter
attr_accessor :name, :yrs_experience

@@all = []

def initialize(name, exper)
  @name = name
  @yrs_experience = exper
  @@all << self
end

def self.all
  @@all
end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end
  
  def meals
    Meal.all.select {|meal| meal.waiter == self}
  end
  
  def best_tipper
    best_tipper = nil
    best_tip = 0
    
    self.meals.each do |meal|
      if meal.tip > best_tip
        best_tip = meal.tip
        best_tipper = meal.customer
      end
    end
    best_tipper
  end

end