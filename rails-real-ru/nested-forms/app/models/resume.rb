# frozen_string_literal: true

class Resume < ApplicationRecord
  validates :name, presence: true
  validates :contact, presence: true

  # BEGIN
  has_many :educations, class_name: 'ResumeEducation', dependent: :destroy
  accepts_nested_attributes_for :educations, reject_if: :all_blank, allow_destroy: true
  has_many :works, class_name: 'ResumeWork', dependent: :destroy
  accepts_nested_attributes_for :works, reject_if: :all_blank, allow_destroy: true
  # END
end
