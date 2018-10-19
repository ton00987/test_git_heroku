class Movie < ActiveRecord::Base
  private
    # Using a private method to encapsulate the permissible parameters is just a good pattern
    # since you'll be able to reuse the same permit list between create and update. Also, you
    # can specialize this method with per-user checking of permissible attributes.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end
end