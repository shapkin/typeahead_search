class Author < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  
  index_name "bonsai-#{Rails.env}"

  settings :analysis => {
      :filter => {
          :edge_ngram => {
              "type" => "edgeNGram",
              "max_gram" => 10,
              "min_gram" => 2,
              "side" => "front"
          }
      },
      :analyzer => {
          :autocomplete => {
              "tokenizer" => "lowercase",
              "filter" => ["edge_ngram"],
              "type" => "custom"
          }
      }
  } do
    mapping {
      indexes :name, :type => 'multi_field', :fields => {
          :name => {:type => "string"},
          :autocomplete => {:type => "string", :analyzer => "autocomplete"}
      }
    }
  end

  def to_indexed_json
    { id: id, name: name }.to_json
  end

  attr_accessible :name
end