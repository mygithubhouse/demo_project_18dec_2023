ActiveAdmin.register Department do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :department_name
  
  form do |f|
    f.inputs 'Create department' do
      f.input :department_name
      # Add other form inputs as needed
    end
    f.actions
  end

  controller do
    def create
      super do |success, failure|
        failure.html do
          flash.now[:error] = 'There was an error creating the record.'
          render :new
        end
      end
    end

    def update
      super do |success, failure|
        failure.html do
          flash.now[:error] = 'There was an error updating the record.'
          render :edit
        end
      end
    end
  end
  
end
