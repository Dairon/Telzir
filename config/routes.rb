Rails.application.routes.draw do
    get "telzir/result", to: "telzir#result"
    root to: "telzir#index"
end
