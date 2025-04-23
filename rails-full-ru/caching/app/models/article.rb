# frozen_string_literal: true

class Article < ApplicationRecord
  # BEGIN
  def last_reading_date
    Rails.cache.fetch("#{cache_key_with_version}/cached_articles", expires_in: 12.hours) do
      DateTime.current
    end
  end
  # END
end
