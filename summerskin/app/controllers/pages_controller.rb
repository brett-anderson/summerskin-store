class PagesController < ApplicationController
  
  def about
    @page = Page.where(:title => 'About').first
  end
  def contact
    @page = Page.where(:title => 'Contact').first
  end
  def create
        
  end
end
