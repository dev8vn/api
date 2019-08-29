defmodule ApiWeb.Router do
  use ApiWeb, :router
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  # scope "/api", ApiWeb do
  #   pipe_through :api
  # end

  forward "/graphql", Absinthe.Plug,
    schema: ApiWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: ApiWeb.Schema,
    socket: ApiWeb.UserSocket
end
