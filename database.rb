require 'sqlite3'

class DBHandler

	def initialize()
		begin
			db = SQLite3::Database.open "movie.db"
			dbstatement = "CREATE TABLE IF NOT EXISTS Movies(ID INTEGER PRIMARY KEY , Name TEXT)"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception 0ccured"
			puts e
		ensure
			db.close if db
		end
	end

	def create(val)
		begin
			db = SQLite3::Database.open "movie.db"
			dbstatement = "INSERT INTO Movies(Name) VALUES ('#{val}')"
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
			db = SQLite3::Database.open "movie.db"
			dbstatement = "SELECT * FROM Movies"
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
			db = SQLite3::Database.open "movie.db"
			dbstatement = "SELECT * FROM Movies WHERE id = '#{val}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end

	

	def update(id , name)
		begin
			db = SQLite3::Database.open "movie.db"
			dbstatement = "UPDATE Movies SET Name= '#{name}' WHERE id= '#{id}'"
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
			db = SQLite3::Database.open "movie.db"
			dbstatement = "DELETE FROM Movies WHERE id='#{id}'"
			db.execute dbstatement
		rescue SQLite3::Exception => e
			puts "Exception Occured"
			puts e
		ensure 
			db.close if db
		end 
	end
end			
