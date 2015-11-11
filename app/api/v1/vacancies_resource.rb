class V1::VacanciesResource < V1
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def vacancy_params
      (params[:vacancy] || {})
    end
  end

  namespace :vacancies do
    # desc 'Vacancys retreaving.'
    get '/', :jbuilder => 'vacancies/index.json' do
      @vacancies = Vacancy.order(:salary => 'DESC')
    end

    # desc 'Vacancy creating.'
    post '/', :jbuilder => 'vacancies/create.json' do
      @vacancy = Vacancy.new(vacancy_params)

      unless @vacancy.save
        error_422! @vacancy.errors
      end
    end
    
    # desc 'Vacancy showing.'
    get ':id', :jbuilder => 'vacancies/show.json' do
      @vacancy = Vacancy.find(params[:id])
    end

    # desc 'Vacancy updating.'
    put ':id', :jbuilder => 'vacancies/update.json' do
      @vacancy = Vacancy.find(params[:id])

      unless @vacancy.update_attributes(vacancy_params)
        error_422! @vacancy.errors
      end
    end

    # desc 'Vacancy\'s skills.'
    namespace ':id/skills' do
      # desc 'Vacancy's skills retreaving.'
      get '/', :jbuilder => 'vacancies/skills/index.json' do
        @vacancy = Vacancy.find(params[:id])
        @skills = @vacancy.skills
      end

      # desc 'Adding skill to vacancy\'s skills.'
      post ':skill_id', :jbuilder => 'vacancies/skills/add.json' do
        @vacancy = Vacancy.find(params[:id])
        @skill = Skill.find(params[:skill_id])
        
        @vacancy.skills << @skill
      end

      # desc 'Remove skill from vacancy\'s sills.'
      delete ':skill_id', :jbuilder => 'vacancies/skills/remove.json' do
        @vacancy = Vacancy.find(params[:id])
        @skill = Skill.find(params[:skill_id])
        
        @vacancy.skills.delete(@skill)
      end
    end

    # desc 'Employees for vacancy.'
    namespace ':id/employees' do
      # desc 'Employees for vacancy retreaving.'
      get '/', :jbuilder => 'vacancies/employees/index.json' do
        @vacancy = Vacancy.find(params[:id])
        
        if params[:full_match] == 'true'
          @employees = @vacancy.skill_employees.actively_seeking.full_match.uniq
        else
          @employees = @vacancy.skill_employees.actively_seeking.uniq
        end
      end
    end
  end
end