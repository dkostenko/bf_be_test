class V1::VacanciesResource < V1
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def create_params
      (params[:vacancy] || {})
    end
  end

  namespace :vacancies do
    # desc 'Vacancys retreaving'
    get '/', :jbuilder => 'vacancies/index.json' do
      @vacancies = Vacancy.all
    end

    # desc 'Vacancy creating'
    post '/', :jbuilder => 'vacancies/create.json' do
      @vacancy = Vacancy.new(create_params)

      unless @vacancy.save
        error_422! @vacancy.errors
      end
    end
    
    # desc 'Vacancy show'
    get ':id', :jbuilder => 'vacancies/show.json' do
      @vacancy = Vacancy.find(params[:id])
    end
  end
end