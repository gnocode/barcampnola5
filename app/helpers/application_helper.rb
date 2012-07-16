module ApplicationHelper
  def logo_link
    nola = content_tag :span, "NOLA"
    vation = content_tag :span, "VATION", class: "blue"
    logo = link_to nola + vation, root_path, class: "logo"
  end
end
