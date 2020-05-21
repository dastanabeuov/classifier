class ClassifierController < ApplicationController
  def index
    @xroots = Xroot.all
    @xcategories = Xcategory.all
    @xclasses = Xclass.all
    @properties = Property.all    
  end
end
