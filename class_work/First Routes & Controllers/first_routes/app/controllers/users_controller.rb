class UsersController < ApplicationController
    def index
        render json: User.all

    end
    def create
            user = User.new(user_params)
            # replace the `user_attributes_here` with the actual attribute keys
         if user.save
            render json: user

        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

          
    end

    def user_params
        params.require(:user).permit(:name,:email) # acts as a contraint  only allows changes of these values
    end

    def show

        render json: User.find(params[:id])

    end

    
    def destroy
        user=User.find(params[:id])
        user.destroy # calls rails own destroy function ?
        render json: user
    end
    
    def update
        user=User.find(params[:id])

        success = user.update(self.user_params)
        if success
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end

    end
    
end