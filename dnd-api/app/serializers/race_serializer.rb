class RaceSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :speed, :age, :alignment, :size_description, :language_desc,:img_url
end
