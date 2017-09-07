module Web::Controllers::Books
  class Create
    include Web::Action

    def call(params)
      BookRepository.new.create(params[:book])

      redirect_to '/books'
    end
  end
end
