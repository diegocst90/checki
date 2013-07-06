module ApplicationHelper
  def get_str_order(column,order,init='ASC')
    if order.include?(column)
      if order.include?("ASC")
        return "#{column} DESC"
      else
        return "#{column} ASC"
      end
    else
      return "#{column} #{init}"
    end
  end

  def get_str_order_title(str_order,name)
    if str_order.include?("ASC")
      return "Ordenar por #{name} Ascendentemente"
    else
      return "Ordenar por #{name} Descendentemente"
    end
  end
end
