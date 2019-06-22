defmodule Discuss.Topic do
  use Discuss.Web, :model

  schema "topics" do
    field :title, :string
  end

  # struct represents a record in our database
  # a description of the new properties we want to update our struct with
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title]) # produces a changeset (how we want to update the database)
    |> validate_required([:title])  # inspect properties of the changeset and determines if its valid or not
  end
end