class Author < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks

  attr_accessible :name

  mapping do
    indexes :id, index: :not_analyzed
    indexes :name, analyzer: 'snowball', boost: 100
  end

  def to_indexed_json
    { id: id, name: name }.to_json
  end
end