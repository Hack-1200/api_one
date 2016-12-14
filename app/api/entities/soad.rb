module Entities
  class Soad < Grape::Entity

    ############################### SUCCESS #################################

    expose :success

    ###############################  DATA  ##################################

    # present_collection true, :data
    expose :object, as: :data, using: Entities::Userg

    ###############################  ERROR  #################################
    expose :error do
      expose :code
      expose :message
    end

    private

    def errors?
      object.errors.any?
    end

    def success
      !errors?
    end


    def code
      0
    end

    def message
      object.errors.full_messages.first
    end
  end
end
