module ApplicationHelper
    def display_name(value)
        if value == 'male'
          '男性'
        elsif value == 'female'
          '女性'
        end
      end
end
