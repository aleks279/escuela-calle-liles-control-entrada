# frozen_string_literal: true

FactoryBot.define do
  factory :registry do
    notes { Faker::Lorem.sentence }
    registry_type { "Salida" }
  end
end
