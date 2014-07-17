class Institution::Base < ActiveRecord::Base
  include OptimallyInheritable
  support_sti_for %w[Institution::NonProfit Institution::Commercial]
end
