module OptimallyInheritable
  extend ActiveSupport::Concern

  module ClassMethods
    def support_sti_for cls_list
      @sti_cls_list = []
      @sti_cls_list += cls_list
    end

    # TODO child class support
    def sti_cls_list
      if superclass.respond_to? :sti_cls_list
        superclass.sti_cls_list
      else
        @sti_cls_list
      end
    end

    def find_sti_class type_name
      idx = type_name.to_i
      super if idx == 0
      sti_cls_list[type_name.to_i-1].constantize
    rescue NameError, TypeError
      super
    end

    def sti_name
      idx = sti_cls_list.index(self.name)
      if idx.nil?
        super
      else
        idx + 1
      end
    end

  end
end
