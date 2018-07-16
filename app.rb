require_relative 'config/environment'

class App < Sinatra::Base

    get '/' do
        erb :new
    end

    post '/student' do
        @student = Student.new(params[:student])
        # Pay attention to the above parameters being passed!

        params[:student][:courses].each do |details|
            Course.new(details)
        end
        # This block of code accesses the array of :courses and creates a new course based on the details — the name and topic. Pay attention to how the nested information params[:student][:courses] is being accessed.

        @courses = Course.all
        #  This store the instantiated courses in the instance variable @courses, making the course information available within our view, student.erb

        erb :student
        #  Loads the erb file student.erb

    end

end
