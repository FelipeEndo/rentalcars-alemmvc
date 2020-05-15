class CarModelDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers
  delegate_all

  def photo_url
    return attached_photo_url if photo.attached?

    'https://via.placeholder.com/150'
  end

  def manufacture_name
    manufacture&.name || ''
  end

  private

  def attached_photo_url
    rails_blob_path(photo, only_path: true)
  end

end
