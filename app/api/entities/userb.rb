
  module Entities
    class Userb < Grape::Entity
          root 'users'
          format_with(:iso_timestamp) { |dt| dt.iso8601 }
          # :success
          expose :success
          # expose :data do

            # unless :anyErrors
            #   nil
            # end
            # if :success
              # expose :id
              # expose :name
              # expose :email
              # expose :password
              # expose :password_confirmation
              # with_options(format_with: :iso_timestamp) do
              #   expose :created_at
              #   expose :updated_at
              # end
              present_collection true, :data
              expose :data, using: Entities::Userg #, if: lambda { |instance, options| instance.errors.any? }
              # present_collection true, :object1  # `collection_name` is optional and defaults to `items`
              # expose :object1, using: Entities::Userg
              # expose :user do |status, op|

              # present object, with: Entities::Userg
            # else
            #   nil
            # end
          # end

          expose :error do
              expose :code
              expose :message , if: Proc.new {anyErrors}
          end

        private


        # def message
        #      object.errors.full_messages.first
        # end

        def anyErrors
            !object.blank?
            #  errors ||= myObject.errors.any?
            #  !!errors
        end

        def myObject
              mmm ||= object

        end

        def code
          1
          # er_code = {}
        end

        def success
          !anyErrors
        end
      end
    end
  # end
