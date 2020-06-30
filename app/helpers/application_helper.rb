module ApplicationHelper
  def active?(path)
    'active' if current_page?(path)
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
end
