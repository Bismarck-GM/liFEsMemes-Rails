module ApplicationHelper
  def render_navbar_links
    user_is_logged? ? 'partials/welcome_exit_links' : 'partials/unlogged_links'
  end

  def render_like_dislike(article)
    if already_voted?(article)
      render partial: 'partials/dislike', locals: { article: article }
    else
      render partial: 'partials/like', locals: { article: article }
    end
  end

  def page_active?(path)
    'active' if current_page?(path)
  end

  def toastr_flash_messages
    flash.each_with_object([]) do |(type, message), flash_messages|
      type = 'success' if type == 'notice'
      type = 'error' if type == 'alert'
      text = "<script>toastr.#{type}('#{message}', '', { positionClass : 'toast-top-center' })</script>"
      flash_messages << text.html_safe if message
    end.join("\n").html_safe
  end
end
