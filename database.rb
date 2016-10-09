require 'sqlite3'

class DBHandler

	def initialize()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "CREATE TABLE IF NOT EXISTS Students(ID INTEGER PRIMARY KEY , firstname TEXT , lastname TEXT , major TEXT , email TEXT)"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception 0ccured"
			puts e
		ensure
			db.close if db
		end
	end

	def create(firstname , lastname , major , email)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "INSERT INTO Students(firstname , lastname , major , email) VALUES ('#{firstname}' , '#{lastname}' ,'#{major}' , '#{email}')"
			db.execute dbstatement
		rescue SQLite3::Exception => e 
			puts "Exception Occured"
			puts e
		ensure
			db.close if db 
		end
	end 


	def all()
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "SELECT * FROM Students"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end

	def get(val)
		begin 
			db = SQLite3::Database.open "student.db"
			dbstatement = "SELECT * FROM Students WHERE id = '#{val}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end

	

	def update(val, firstname , lastname , major , email)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "UPDATE Students SET firstname = '#{firstname}' , lastname = '#{lastname}' , major = '#{major}' , email = '#{email}'  WHERE id = '#{val}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end

	def destroy(id)
		begin
			db = SQLite3::Database.open "student.db"
			dbstatement = "DELETE FROM Students WHERE id='#{id}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end
end			
