Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'jobsearch', to: 'home#jobsearch'
  get 'jdp/:did', to: 'home#jdp'
end
