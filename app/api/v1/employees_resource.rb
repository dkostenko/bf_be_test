class V1::EmployeesResource < V1
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def employee_params
      (params[:employee] || {})
    end
  end

  namespace :employees do
    # desc 'Employees retreaving.'
    get '/', :jbuilder => 'employees/index.json' do
      @employees = Employee.order(:salary => 'ASC')
    end

    # desc 'Employee creating.'
    post '/', :jbuilder => 'employees/create.json' do
      @employee = Employee.new(employee_params)

      unless @employee.save
        error_422! @employee.errors
      end
    end

    # desc 'Employee showing.'
    get ':id', :jbuilder => 'employees/show.json' do
      @employee = Employee.find(params[:id])
    end

    # desc 'Employee updating.'
    put ':id', :jbuilder => 'employees/update.json' do
      @employee = Employee.find(params[:id])

      unless @employee.update_attributes(employee_params)
        error_422! @employee.errors
      end
    end

    # desc 'Employee appropriate vacancies.'
    get ':id/appropriate_vacancies', :jbuilder => 'employees/appropriate_vacancies.json' do
      @employee = Employee.find(params[:id])
      
      @vacancies = @employee.skill_vacancies
    end

    # desc 'Employee skills.'
    namespace ':id/skills' do
      # desc 'Employee skills retreaving.'
      get '/', :jbuilder => 'employees/skills/index.json' do
        @employee = Employee.find(params[:id])
        @skills = @employee.skills
      end

      # desc 'Adding skill to employee\'s skills.'
      post ':skill_id', :jbuilder => 'employees/skills/add.json' do
        @employee = Employee.find(params[:id])
        @skill = Skill.find(params[:skill_id])
        
        @employee.skills << @skill
      end

      # desc 'Remove skill from employee\'s sills.'
      delete ':skill_id', :jbuilder => 'employees/skills/remove.json' do
        @employee = Employee.find(params[:id])
        @skill = Skill.find(params[:skill_id])
        
        @employee.skills.delete(@skill)
      end
    end

    # desc 'Vacancies for employee.'
    namespace ':id/vacancies' do
      # desc 'Vacancies for employee retreaving.'
      get '/', :jbuilder => 'employees/vacancies/index.json' do
        @employee = Employee.find(params[:id])
        @vacancies = @employee.skill_vacancies.available.uniq
      end
    end
  end
end