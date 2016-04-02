class ShortDreamerSerializer < ActiveModel::Serializer
  attributes :id, :full_name, :vip, :celebrity, :avatar, :url

  def full_name
    "#{object.first_name} #{object.last_name}"
  end

  def vip
    object.is_vip?
  end

  def avatar
    versions = [:small, :pre_medium, :medium, :large]
    versions.inject({}) { |acc, version| acc[version] = "https:#{ object.avatar.url(version) }"; acc }
  end

  def url
    Rails.application.routes.url_helpers.account_dreamer_dreams_path(I18n.locale, object.id)
  end
end
