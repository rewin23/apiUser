defmodule ApiUser.UserController do
	use ApiUser.Web, :controller

	alias ApiUser.Users
	alias ApiUser.Users.User

	def index(conn, _params) do
		users = Users.list_users()
		render(conn, "index.json", users: users)
	end
end