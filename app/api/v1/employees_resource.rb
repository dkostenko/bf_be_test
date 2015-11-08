class V1::EmployeesResource < V1
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def create_params
      (params[:employee] || {})
    end
  end

  namespace :employees do
    # desc 'Employees retreaving'
    get '/', :jbuilder => 'employees/index.json' do
      @employees = Employee.all
    end

    # desc 'Employee creating'
    post '/', :jbuilder => 'employees/create.json' do
      @employee = Employee.new(create_params)

      unless @employee.save
        error_422! @employee.errors
      end
    end

    # desc 'Employee show'
    get ':id', :jbuilder => 'employees/show.json' do
      @employee = Employee.find(params[:id])
    end
  end
end