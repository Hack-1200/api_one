
  module Entities
    class Userb < Grape::Entity
          root 'users'
          format_with(:iso_timestamp) { |dt| dt.iso8601 }

          expose :success
          expose :data do
            if :anyErrors
              expose :id
              expose :name
              expose :email
              expose :password
              expose :password_confirmation
              # with_options(format_with: :iso_timestamp) do
              #   expose :created_at
              #   expose :updated_at
              # end
            else
              nil
            end
          end

          expose :error do
            if :anyErrors
              expose :code
              expose :message
            else
              nil
            end
          end

        private


        def attr_not_on_wrapped_object
             object.errors.full_messages.first
        end

        def anyErrors
             errors ||= object.errors.any?

        end

        def code
          1
        end

        def message
          attr_not_on_wrapped_object
        end

        def success
          !anyErrors
        end
      end
    end
  # end
