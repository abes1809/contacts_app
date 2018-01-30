class PagesController < ApplicationController

  def index
    search_term = params[:search]

    @contacts = Contact.all 

    if search_term 
      @contacts = @contact.where("first_name iLIKE ? OR middle_name iLIKE ? OR last_name iLIKE ? OR bio 
                              iLIKE ? OR email iLIKE ? OR phone_number iLIKE ?",
                              "%#{search_term}%",
                              "%#{search_term}%", 
                              "%#{search_term}%", 
                              "%#{search_term}%", 
                              "%#{search_term}%", 
                              "%#{search_term}%"
                              )
    end 

    render 'index.json.jbuilder' 
  end

  def create 
    @contact = Contact.new(
                          first_name: params[:first_name],
                          middle_name: params[:middle_name],
                          last_name: params[:last_name],
                          bio: params[:bio],
                          email: params[:email],
                          phone_number: params[:phone_number]
                          )
    @contact.save 

    if @contact.save 
      render 'show.json.jbuilder'
    else 
      render json: {errors: @contact.errors.full_messages}, status: :unprocessable_entity 
    end 
  end 

  def show  
    @contact = Contact.find(params[:id])
    render 'show.json.jbuilder'
  end 

  def update 
    @contact = Contact.find(params[:id])

    @contact.first_name = params[:first_name] || @contact.first_name
    @contact.middle_name = params[:middle_name] || @contact.middle_name
    @contact.last_name = params[:last_name] || @contact.last_name
    @contact.bio = params[:bio] || @contact.bio 
    @contact.email = params[:email] || @contact.email
    @contact.phone_number = params[:phone_number] || @contact.phone_number

    @contact.save

    if @contact.save 
      render 'index.json.jbuilder'
    else 
      render json: {errors: contact.errors.full_messages}, status: :unprocessable_entity 
    end  
  end 

  def destroy 
    contact = Contact.find(params[:id])
    contact.destroy 
    render json: { message: "Contact ##{contact.id} has successfuly been deleted" }
  end 
end
