module Entities
  class Soad < Grape::Entity

    ############################### SUCCESS #################################

    expose :success

    ###############################  DATA  ##################################

    # present_collection true, :data
    expose :object, as: :data, using: Entities::Userg
    expose :data, if: lambda { |instance, options| errors?}

    ###############################  ERROR  #################################
    expose :error do
      expose :code
      expose :message, if: lambda { |instance, options| errors? }
    end

    private

    def isHash
      ish ||= (object.class == Hash)
    end

    def errors?
      if !isHash
        object.errors.any? || !options[:option].blank?
      else
        !options[:option].blank?
      end
    end

    def success
      !errors?
    end


    def code
      0
    end

    def message
      if !isHash
        object.errors.full_messages.first
      else
        options[:option]
      end
    end

    def data

    end
  end
end
