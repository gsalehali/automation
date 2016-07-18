Rails.application.routes.draw do
  get 'home/index'

  get 'home/aboutus'

  get 'home/faq'

  get 'home/contactus'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#index"
end
