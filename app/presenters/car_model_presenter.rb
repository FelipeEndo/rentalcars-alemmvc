class CarModelPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  delegate :image_tag, to: :helpers

  def manufacture_name
    manufacture&.name || ''
  end

  def photo_tag
    return attached_photo if photo.attached?

    ''
  end


  private

  def helpers
    ApplicationController.helpers
  end

  def attached_photo
    photo_url = rails_blob_path(photo, only_path: true)
    image_tag(photo_url, class: 'card-img-top')
  end
end
