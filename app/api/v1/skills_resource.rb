class V1::SkillsResource < V1
  formatter :json, Grape::Formatter::Jbuilder

  helpers do
    def create_params
      (params[:skill] || {})
    end
  end

  namespace :skills do
    # desc 'Skills retreaving'
    get '/', :jbuilder => 'skills/index.json' do
      @skills = Skill.all
    end

    # desc 'Skill creating'
    post '/', :jbuilder => 'skills/create.json' do
      @skill = Skill.new(create_params)

      unless @skill.save
        error_422! @skill.errors
      end
    end
  end
end