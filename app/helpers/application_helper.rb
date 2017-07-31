module ApplicationHelper

  def active_tab active_tab, tab
    active_tab == tab ? "class= active" : ""
  end
end
