class PagesController < ApplicationController
  
  def about
    @page = Page.where(:title => 'About').first
  end
  def contact
    @page = Page.where(:title => 'Contact').first
  end
  def mercury_update
    page = Page.find(params[:id])
    page.name = params[:content][:page_name][:value]
    page.content = params[:content][:page_content][:value]
    page.save!
    render text: ""
  end
  def create
        
  end
end
