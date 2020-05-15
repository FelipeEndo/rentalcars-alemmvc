class CarModelPresenter < SimpleDelegator
  include Rails.application.routes.url_helpers
  delegate :image_tag, to: :helpers

  def photo_tag
    image_tag(photo_url, class: 'card-img-top')
  end


  private

  def helpers
    ApplicationController.helpers
  end
end
