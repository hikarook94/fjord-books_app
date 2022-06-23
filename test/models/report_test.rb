# frozen_string_literal: true

require 'test_helper'
require 'date'

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
    assert_equal Date.parse('2022-06-10'), @report.created_on
  end
end
