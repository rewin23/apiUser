defmodule ApiUser.UserController do
	use ApiUser.Web, :controller

	def index(conn, _params) do
		render conn, "index.html"
	end
end