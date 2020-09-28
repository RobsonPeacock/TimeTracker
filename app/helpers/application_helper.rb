module ApplicationHelper
  def admin_types
    ['AdminUser']
  end

  def active?(path)
    'active' if current_page?(path)
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
  end

  def flash_message
    messages = []

    flash.each do |type, message|
      next if message.blank?

      level = case type
      when "notice" then "success"
      when "alert"  then "error"
      when "info"   then "info"
      when "warn"   then "warn"
      else
        "info"
      end

      js = %[iziToast.#{level}({ title: '#{level.capitalize}:', message: "#{message}" });]
      messages << javascript_tag(js)
    end

    messages.join("/n").html_safe
  end

  def status_label(status)
    status_span_generator(status)
  end

  private

  def status_span_generator(status)
    case status
    when 'submitted'
      content_tag(:span, status.titleize, class: 'badge badge-primary')
    when 'approved'
      content_tag(:span, status.titleize, class: 'badge badge-success')
    when 'rejected'
      content_tag(:span, status.titleize, class: 'badge badge-danger')
    when 'pending'
      content_tag(:span, status.titleize, class: 'badge badge-primary')
    when 'confirmed'
      content_tag(:span, status.titleize, class: 'badge badge-success')
    end
  end
end
