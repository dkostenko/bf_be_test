class InitDb < ActiveRecord::Migration
  def change
    create_table :vacancies do |t|
      t.string     :title
      t.datetime   :expired_at
      t.integer    :salary
      t.string     :contacts

      t.timestamps null: false
    end

    create_table :employees do |t|
      t.string    :name
      t.string    :email
      t.string    :phone
      t.boolean   :status
      t.integer   :salary

      t.timestamps null: false
    end
    
    create_table :skills do |t|
      t.string  :name

      t.timestamps null: false
    end

    create_table :skills_holders, id: false do |t|
      t.belongs_to :skill, :index => true

      t.integer :holder_id
      t.string  :holder_type
    end
  end
end
