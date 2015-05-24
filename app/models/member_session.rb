class MemberSession < Authlogic::Session::Base 
	extend ActiveModel::Naming
	authenticate_with Member
end  