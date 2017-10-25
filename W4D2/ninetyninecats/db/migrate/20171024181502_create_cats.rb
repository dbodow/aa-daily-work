class CreateCats < ActiveRecord::Migration[5.1]
  def change
    create_table :cats do |t|
      t.date :birth_date, null: false
      t.string :color, null: false
      t.string :name, null: false
      t.string :sex, limit: 1, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end

# Test cats
# a = Cat.new(birth_date: '2015/01/20', color: :black, name: 'Joe', sex: 'male', description: 'one cool cat')
# b = Cat.new(birth_date: '2015/01/20', color: :black, name: 'Joe', sex: 'M', description: 'one cool cat')
# c = Cat.new(birth_date: '2015/20/21', color: :black, name: 'Joe', sex: 'M', description: 'one cool cat')
# d = Cat.new(birth_date: '2015/01/20', color: :black, name: 'Joe', sex: 'M', description: 'one cool cat')
# e = Cat.new(birth_date: '2015/01/20', color: :pink, name: 'Joe', sex: 'M', description: 'one cool cat')
