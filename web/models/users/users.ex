defmodule ApiUser.Users do
	import Ecto.Query, warn: false
	alias ApiUser.Repo
	
	alias ApiUser.Users.User

	def list_users, do: Repo.all(ApiUser.User)

	def get_user(id), do: Repo.get(User, id)
end