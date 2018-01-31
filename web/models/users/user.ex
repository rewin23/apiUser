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

	def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end