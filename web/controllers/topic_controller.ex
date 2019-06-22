defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  # conn = connection, Elixir struct representing both the incoming and outgoing request
  # params = to help us parse the URL
  def new(conn, params) do
    changeset = Topic.changeset(%Topic{},  %{})

    render conn, "new.html"
  end
end