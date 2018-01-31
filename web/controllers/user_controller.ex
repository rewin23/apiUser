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
			conn
    		|> put_status(:not_found)
    		|> render("show.json", user: user)
		end
	end

	def create(conn, params) do
		changeset = ApiUser.User.changeset( %ApiUser.User{}, params)

		case Repo.insert(changeset) do
			{:ok, user} -> json conn |> put_status(:created), user

			{:error, _changeset} -> json conn |> put_status(:bad_request), %{error: ["unable to create user"]}
		end	
	end

	def update(conn, %{"id" => id} = params) do
		user = Repo.get(ApiUser.User, id)
		if user do
			changeset = ApiUser.User.changeset(user, params)
			case Repo.update(changeset) do
				{:ok, user} -> json conn |> put_status(:ok), user
				{:error, result} -> json conn |> put_status(:bad_request), %{errors: ["invalid user"]}
			end
		end
	end	

end