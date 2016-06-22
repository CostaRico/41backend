module ApplicationHelper
  def menu
    @menu ||= I18n.t('adminka.menu').map do |model_name, title|
      { name: title, path: path(model_name) }
    end
  end

  def path(object)
    send("adminka_#{object}_path".to_sym)
  end
end
