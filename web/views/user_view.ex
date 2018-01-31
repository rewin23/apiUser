defmodule ApiUser.UserView do
	use ApiUser.Web, :view
	alias ApiUser.UserView

	def render("index.json", %{user: user}) do
		%{data: render_many(users, UserView, "user.json")}
	end

	def render("show.json", %{user: user}) do
		%{data: render_one(user, UserView, "user.json")}
	end
end