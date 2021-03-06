defmodule SpecRouter do
  require Ueberauth
  use Plug.Router

  plug :fetch_query_params

  Ueberauth.plug "/auth"

  plug :match
  plug :dispatch

  get "/auth/identity", do: send_resp(conn, 200, "identity request")
  get "/auth/identity_with_options", do: send_resp(conn, 200, "identity with options request")

  get "/auth/identity/callback", do: send_resp(conn, 200, "identity callback")
  get "/auth/identity_with_options/callback", do: send_resp(conn, 200, "identity with options callback")
end

ExUnit.start()
