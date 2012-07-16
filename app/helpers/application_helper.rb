module ApplicationHelper
  def logo_link
    nola = content_tag :span, "NOLA"
    vation = content_tag :span, "VATION", class: "blue"
    logo = link_to nola + vation, root_path, class: "logo"
  end

  def view_title(title = nil)
    if title
      "NOLAvation - " + @title
    else
      "NOLAvation"
    end
  end
end
