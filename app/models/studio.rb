class Studio < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :reservations, dependent: :destroy

  include AlgoliaSearch

  algoliasearch do
    attributes :name, :location, :size
    searchableAttributes ['name', 'location', 'size']
  end

  include PgSearch::Model
  pg_search_scope :search_by_name_and_location,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }
end
