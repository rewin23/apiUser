defmodule ApiUser.UserController do
	use ApiUser.Web, :controller

	alias ApiUser.Users
	alias ApiUser.Users.User

	def index(conn, _params) do
		users = Users.list_users()
		render(conn, "index.json", users: users)
	end

	def show(conn, %{"id" => id}) do
		user = Users.get_user(id)

		if user do
			render(conn, "show.json", user: user)
		else
			conn·
			|> put_status(:not_found)
			|> render("show.json", user: user)
		end
	end
end