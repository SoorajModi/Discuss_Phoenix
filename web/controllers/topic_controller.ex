defmodule Discuss.TopicController do
  use Discuss.Web, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end

  # conn = connection, Elixir struct representing both the incoming and outgoing request
  # params = to help us parse the URL
  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{},  %{})

    render conn, "new.html", changeset: changeset     # how you pass in custom variables to a template
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)

    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to:  topic_path(conn, :index))
      {:error, changeset} ->
        render conn, "new.html", changeset: changeset
    end
  end
end