Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    resources :posts, only: [:index, :show]
    root "posts#index"
  end
end
