# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @report = reports(:alice_report)
  end

  test '#editable?' do
    assert_not @report.editable?(@bob)
    assert @report.editable?(@alice)
  end

  test '#created_on' do
    assert_equal '2022-06-10', @report.created_on.to_s
  end
end
