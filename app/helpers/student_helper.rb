module StudentHelper
    def display_name(value)
        if value == 'male'
          '男性'
        elsif value == 'female'
          '女性'
        else
          '不明'
        end
      end
    
      def display_age(value)
        case value
        when 'teenage'
          '10代'
        when 'twenties'
          '20代'
        when 'thirties'
          '30代'
        else
          '不明'
        end
      end
end
