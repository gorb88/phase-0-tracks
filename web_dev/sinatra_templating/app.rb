# require gems
require 'sinatra'
require 'sqlite3'

set :public_folder, File.dirname(__FILE__) + '/static'

db = SQLite3::Database.new("students.db")
db2 = SQLite3::Database.new("grades.db")
db.results_as_hash = true
db2.results_as_hash = true

# show students on the home page
get '/' do
  @students = db.execute("SELECT * FROM students")
  erb :home
end


get '/students/new' do
  erb :new_student
end

get '/grade' do
  name = params['name']
  @grades= db2.execute("SELECT * FROM grades WHERE name = #{name}")
  erb :grade
end

get '/add_grade/new' do
  erb :new_grade
end

# create new students via
# a form
post '/students' do
  db.execute("INSERT INTO students (name, campus, age) VALUES (?,?,?)", [params['name'], params['campus'], params['age'].to_i])
  redirect '/'
end

post '/add_grade' do
   db2.execute("INSERT INTO grades (name, grade) VALUES (?,?)", [params['name'],params['grade'].to_i])
  redirect '/'
end

# add static resources
