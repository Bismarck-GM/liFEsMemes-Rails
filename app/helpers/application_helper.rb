module ApplicationHelper
  def render_navbar_links
    user_is_logged? ? 'partials/welcome_exit_links' : 'partials/unlogged_links'
  end

  def page_active?(path)
    'active' if current_page?(path)
  end

  def toastr_flash_messages
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { closeButton: false, progressBar: true })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
