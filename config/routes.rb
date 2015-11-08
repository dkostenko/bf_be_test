Rails.application.routes.draw do
  scope path: :api do
    mount V1 => '/v1'
  end
end
