# frozen_string_literal: true

class PostPolicy < ApplicationPolicy
  attr_reader :user, :post
  # BEGIN
  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def show?
    true
  end

  def edit?
    user&.admin? || post.author_id == user&.id
  end

  def update?
    edit?
  end

  def destroy?
    user&.admin?
  end
  # END
end
