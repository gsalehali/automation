Rails.application.routes.draw do
  get 'home/index'

  get 'home/about'

  get 'home/FAQ'

  get 'home/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
