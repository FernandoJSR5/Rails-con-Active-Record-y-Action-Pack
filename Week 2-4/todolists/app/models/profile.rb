class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, :inclusion => {:in => ['male', 'female']}   
	validate :first_name_or_last_name  
	validate :gender_name  

	def first_name_or_last_name   
	  if first_name.nil? && last_name.nil?      
   		errors.add(:first_name, "Specify a first name  or a last year.")    
  	end  
	end  

	def gender_name   
	  if first_name == 'Sue' && gender == 'male'      
	  	errors.add(:first_name, 'cannot be a boy named Sue')   
	  end  
	end  

	def self.get_all_profiles(start_year,test_year)
	  Profile.where(:birth_year => start_year..test_year).order('birth_year asc')  
	end

end
