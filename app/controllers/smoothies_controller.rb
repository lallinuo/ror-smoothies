class SmoothiesController < ApplicationController
  # GET /smoothies
  # GET /smoothies.json
  def index
    @smoothies = Smoothie.all

    respond_to do |format|
      format.html # index.html.erb
      format.json do
        render :json => @smoothies.to_json(:include => { :ingredients => { :only => :name } })
      end

    end
  end

  # GET /smoothies/1
  # GET /smoothies/1.json
  def show
    @comment = Comment.new
    @smoothie = Smoothie.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @smoothie }
    end
  end

  # GET /smoothies/new
  # GET /smoothies/new.json
  def new
    @smoothie = Smoothie.new
    @ingredients = Ingredient.all
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @smoothie }
    end
  end

  # GET /smoothies/1/edit
  def edit
    @smoothie = Smoothie.find(params[:id])
    @ingredients = Ingredient.all

  end

  # POST /smoothies
  # POST /smoothies.json
  def create
    @smoothie = Smoothie.new(params[:smoothie])
    @ingredients = Ingredient.all

    if params[:ingredients] == nil
      redirect_to :back, notice: "You must choose at least one ingredient"
    else
     if current_user
        respond_to do |format|
          if @smoothie.save
            make_new_recipe(params[:ingredients],@smoothie)
            format.html { redirect_to @smoothie, notice: 'Smoothie was successfully created.' }
            format.json { render json: @smoothie, status: :created, location: @smoothie }
          else

            format.html { render action: "new" }
            format.json { render json: @smoothie.errors, status: :unprocessable_entity }
          end
        end
      end
    end

  end

  # PUT /smoothies/1
  # PUT /smoothies/1.json
  def update
    @smoothie = Smoothie.find(params[:id])

    respond_to do |format|
      if (@smoothie.update_attributes(params[:smoothie]) if @smoothie.user == current_user)
        make_new_recipe(params[:ingredients],@smoothie)

        format.html { redirect_to @smoothie, notice: 'Smoothie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @smoothie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /smoothies/1
  # DELETE /smoothies/1.json
  def destroy
    @smoothie = Smoothie.find(params[:id])
    @smoothie.destroy if @smoothie.user == current_user

    respond_to do |format|
      format.html { redirect_to smoothies_url }
      format.json { head :no_content }
    end
  end
end
