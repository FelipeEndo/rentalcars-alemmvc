module RentalHelper
  def status(rental)
    if rental.scheduled?
      content_tag :span, class: ['badge', 'badge-info'] do
        t(rental.status)
      end
    elsif rental.ongoing?
      content_tag :span, class: ['badge', 'badge-success'] do
        t(rental.status)
      end
    end
  end
end
