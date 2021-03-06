defmodule BlogApp.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogApp.Comments.Comment

  def add_comment(post_id, comment_params) do
    comment_params
    |> Map.put("post_id", post_id)
    |> Comments.create_comment()
  end

  schema "posts" do
    field :body, :string
    field :title, :string
    has_many :comments, BlogApp.Comments.Comment
    
    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
