# frozen_string_literal: true

module ApplicationHelper
  def render_navbar_links
    user_is_logged? ? 'partials/welcome_exit_links' : 'partials/unlogged_links'
  end
end
