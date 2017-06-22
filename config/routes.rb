Rails.application.routes.draw do
  root to: 'lookups#show'
  resource 'lookups', only: :show do
    collection do
      post 'execute'
    end
  end
end
