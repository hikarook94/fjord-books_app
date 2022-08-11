# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @alice = users(:alice)
    @bob = users(:bob)
    @carol = users(:carol)
  end

  test '#name_or_email' do
    assert_equal 'alice@example.com', @alice.name_or_email
    @alice.name = 'Alice'
    assert_equal 'Alice', @alice.name_or_email
  end

  test '#following?' do
    assert @carol.following?(@alice)
    assert_not @carol.following?(@bob)
  end

  test '#followed_by?' do
    assert @alice.followed_by?(@carol)
    assert_not @bob.followed_by?(@carol)
  end

  test '#follow' do
    @alice.follow(@bob)
    assert_equal 'bob@example.com', @alice.followings.find(@bob.id).email
  end

  test '#unfollow' do
    @alice.unfollow(@bob)
    assert @alice.followings.empty?
  end
end
