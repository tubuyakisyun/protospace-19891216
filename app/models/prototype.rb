class Prototype < ApplicationRecord
  resources  :prototypes, only: [:new, :index,:edit, :destroy, :show, :update, :create]
end
