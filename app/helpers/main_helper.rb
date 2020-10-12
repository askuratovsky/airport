module MainHelper
  def badge_class state
    case state
    when 'parked'
      'badge-secondary'
    when 'departed'
      'badge-info'
    when 'in_air'
      'badge-success'
    else
      'badge-danger'
    end
  end
end
