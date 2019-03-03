# frozen_string_literal: true

module ApplicationHelper

  def active_link?(test_controller)
    controller_name == test_controller ? "active" : ""
  end

end
