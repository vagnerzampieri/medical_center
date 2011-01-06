module AdminApplicationHelper
  
  def show_enabled_icon(object)
    alt = (object)? I18n.t(:enabled) : I18n.t(:disabled)
    return image_tag('/images/icons/' + object.to_s + '.png', {:alt => alt, :title => alt})
  end
  
  def enable_confirm_message(object)
    return (object) ? I18n.t(:deactivation_confirm) : I18n.t(:enable_confirm)
  end

end
