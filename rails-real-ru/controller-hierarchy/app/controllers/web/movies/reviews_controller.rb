module Web
    module Movies
        class ReviewsController < Web::Movies::ApplicationController
            def index
                @reviews = resource_movie.reviews
            end

            def new
                @review = resource_movie.reviews.build
            end

            def create
                @review = resource_movie.reviews.build(permitted_reviews_params)
                if @review.save
                    redirect_to movie_reviews_path(resource_movie), notice: t('success')
                else
                    flash[:alert] = t('fail')
                    render :new, status: :unprocessable_entity
                end
            end

            def edit
                @review = resource_movie.reviews.find(params[:id])
            end

            def update
                @review = resource_movie.reviews.find(params[:id])
                if @review.update(permitted_reviews_params)
                    redirect_to movie_reviews_path(resource_movie), notice: t('success')
                else
                    flash[:alert] = t('fail')
                    render :edit, status: :unprocessable_entity
                end
            end

            def destroy
                @reviews = resource_movie.reviews.find(params[:id])
                @reviews.destroy
                redirect_to movie_reviews_path(resource_movie)
            end

            private

            def permitted_reviews_params
                params.require(:review).permit(:body, :movie_id)
            end
        end
    end
end