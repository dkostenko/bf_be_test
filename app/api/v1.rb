require 'grape/jbuilder'

class V1 < Grape::API
  format :json
  content_type :json, 'application/json'

  before do
    env['api.tilt.root'] = 'app/views/api/v1'

    header 'Content-Type', 'application/json; charset=utf-8'
  end

  def self.inherited(subclass)
    super

    helpers do
      def error_400!()
        resp = {
          :code => 400,
          :message => 'bad_request'
        }

        error!(resp, 400)
      end

      def error_404!()
        resp = {
          :code => 404,
          :message => 'not_found',
          :errors => []
        }

        error!(resp, 404)
      end

      def error_422!(errors = {})
        resp = {
          :code => 422,
          :message => 'unprocessable_entity',
          :errors => errors
        }

        error!(resp, 422)
      end

      def error_500!(errors = {})
        resp = {
          :code => 500,
          :message => 'internal_server_error',
          :errors => errors
        }

        error!(resp, 500)
      end
    end
  end

  mount V1::SkillsResource
  mount V1::VacanciesResource
  mount V1::EmployeesResource
end
