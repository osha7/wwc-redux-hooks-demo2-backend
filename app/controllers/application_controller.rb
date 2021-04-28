class ApplicationController < ActionController::Base

    def home
        render json: {message: "Server is up and running!"}
    end

end
