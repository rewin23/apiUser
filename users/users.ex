defmodule ApiUser.Users do
	import Ecto.Query, warn: false
	alias ApiUser.Repo
	
	alias ApiUser.Users.User

	def list_users, do: Repo.all(User)
end