module Entities
  class Rhcp < Grape::Entity

    ############################### SUCCESS #################################

    expose :success

    ###############################  DATA  ##################################

    # present_collection true, :data
    expose :object, as: :data, using: Entities::Userg, if: lambda { |instance, options| success }
    expose :data, if: lambda { |instance, options| errors?}

    ###############################  ERROR  #################################
    expose :error do
      expose :code
      expose :message, if: lambda { |instance, options| !options[:option].blank? }
    end

    private

    def errors?
      !options[:option].blank?
    end

    def success
      !errors?
    end

    def message
      options[:option]
    end

    def code
      0
    end

    def data

    end
  end
end
