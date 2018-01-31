defmodule ApiUser.User do
	use ApiUser.Web, :model
	use Ecto.Schema
	import Ecto.Changeset
	alias ApiUser.User


	schema "users" do
		field :email, :string
		field :password, :string
		field :alias, :string

		timestamps()

	end

	@doc false

	def changeset(%User{} = user, attrs) do
		user
		|> cast(attrs, [:email, :password, :alias])
		|> validate_required([:email, :password, :alias])
	end
end