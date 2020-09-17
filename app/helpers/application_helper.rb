# frozen_string_literal: true

module ApplicationHelper
  def render_navbar_links
    user_is_logged? ? 'partials/welcome_exit_links' : 'partials/unlogged_links'
  end

  def is_page_active(path)
    "active" if current_page?(path)
  end
end
