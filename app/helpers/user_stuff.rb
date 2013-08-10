# class UserStuff
#   def self.create_table
#     "create_table :users do |t|
#       t.string :name, unique: true
#       t.string :email, unique: true, index: true
#       t.string :password_hash
#     end"
#   end

#   # def self.sign_in_bar
#   #   html = <<-EOS <form action="/sign_in" method="post">
#   #     <li><input type="text" name="email" placeholder="Enter email"></li>
#   #     <li><input type="text" name="password" placeholder="Enter password"></li>
#   #     <li><input type="submit" value="Sign In">
#   #   </form>
#   #     <li><a href="/sign_up">Sign up</a></li>
#   #   EOS
#   # end

#   # def self.sign_out_bar
#   #   html = <<-EOS <li><a href='/sign_out'>Sign Out</a></li>
#   #   <li>Hello, #{ User.find(session[:user_id]).name }</li>
#   #   EOS
#   # end 
# end
