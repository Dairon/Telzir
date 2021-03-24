Rails.application.routes.draw do
    post "telzir/result", to: "telzir#result"
    root to: "telzir#index"
end
