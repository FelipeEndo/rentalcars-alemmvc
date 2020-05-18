class RentalPresenter < SimpleDelegator
  attr_reader :rental

  STATUS = {
    'scheduled': 'info',
    'in_review': 'light',
    'ongoing': 'success',
    'finalized': 'primary'
  }

  def status_badge
    status_class = STATUS[status.to_sym]

    helpers.content_tag(:span, class: ["badge badge-#{status_class}"]) do
      I18n.t(status)
    end
  end

  private

  def helpers
    ApplicationController.helpers
  end
end
