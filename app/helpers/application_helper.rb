module ApplicationHelper
  #current menu
	def nav_link link_text, link_path
		link = link_text
		link_text.delete! '/'
		class_name = link_text == params[:controller] ? 'treeview active' : 'treeview'

		content_tag :li, class: class_name do
			link_to link_path, link do
        "<i class='fa fa-dashboard'></i>"
      end
		end
	end

	def format_date dt
		dt.strftime("%d/%m/%Y")
	end
end
