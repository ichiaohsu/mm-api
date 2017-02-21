defmodule BqMaru.API do
  use Maru.Router
  import Plug.Conn

  plug Plug.Parsers, parsers: [:urlencoded, :json],
                     pass: ["text/*"],
                     json_decoder: Poison

  namespace :bq do
    desc "Big Query Rest API"
    get do
      #current_time = String.to_char_list(DateTime.to_string(DateTime.utc_now()))
      #'gcloud beta logging write maru-test "#{current_time}"' |> :os.cmd()
      # Above method unsafe
      current_time = DateTime.to_string(DateTime.utc_now())
      System.cmd "gcloud", ["beta","logging","write", "maru-test", current_time]
      #conn |> text(current_time)
      conn
      |> send_resp(200, "")
    end
    post do
      IO.inspect conn.params
      send_resp(conn, 200, "ok :)")
    end
  end     
end
