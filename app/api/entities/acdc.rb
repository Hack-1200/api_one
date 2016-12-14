module Entities
  class Acdc < Grape::Entity

    ############################### SUCCESS #################################
    expose :succes

    ###############################  DATA  ##################################
    present_collection true, :data
    expose :data, using: Entities::Userg

    ###############################  ERROR  #################################
    expose :error do
      expose :code
      # expose :message
    end


    private

    def succes
      true
    end

    def code
      0
    end

    # def message
    #
    # end
  end
end
