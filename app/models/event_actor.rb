class EventActor < ApplicationRecord
  belongs_to :event
  belongs_to :deity
end