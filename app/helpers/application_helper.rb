module ApplicationHelper
  def full_title page_title = ""
    base_title = t "base_title"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  def cart_count_over_one
    return total_cart_items if total_cart_items > 0
  end

  def total_cart_items
    total = @cart.line_items.map(&:quantity).sum
    return total if total > 0
  end
  
end
