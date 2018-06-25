Rails.application.routes.draw do
  get "/report1", to: "reports#report1"
  get "/report2", to: "reports#report2"
  get "/", to: "reports#report1"
end
