class Institution::Base < ActiveRecord::Base

  ALLOWED_CLASSES = %w[Institution::NonProfit Institution::Commercial]

  class << self

    def find_sti_class type_name
      idx = type_name.to_i
      super if idx == 0
      ALLOWED_CLASSES[idx-1].constantize
    rescue NameError, TypeError
      super
    end

    def sti_name
      idx = ALLOWED_CLASSES.index(self.name)
      if idx.nil?
        super
      else
        idx + 1
      end
    end

  end

end
