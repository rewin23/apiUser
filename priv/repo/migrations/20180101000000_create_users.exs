defmodule ApiUser.Repo.Migrations.CreateUsers do
	use Ecto.Migration

	def change do
		create table(:users) do
			add :email, :string
			add :password, :string
			add :alias, :string

			timestamps()
		end
	end
end