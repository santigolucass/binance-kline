module Calculations
  extend ActiveSupport::Concern

  def moving_average(array, period)
    array.each_cons(period).map { |a| (a.sum / period) }.first
  end
end
