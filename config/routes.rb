HackerNews::Application.routes.draw do

resources :posts, :except => [:show, :edit, :update]
resources :comments
end
