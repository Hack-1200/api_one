
  module Entities
    class Userf < Grape::Entity
          root 'users'
          format_with(:iso_timestamp) { |dt| dt.iso8601 }

          # expose :success

          # expose :data, if: lambda { |instance, options| instance.errors.any? }
          present_collection true, :data
          expose :data, using: Entities::Userg
          # expose :data, if: lambda { |instance, options| options[:foo] }





        ######################################  ERROR  ############################################
          expose :error do
              expose :code
              expose :message , if: Proc.new {anyErrors}
          end

        private


        def message
             object.errors.full_messages.first
        end
        #
        def anyErrors
             errors ||= myObject.errors.any?
             !!errors
        end

        # def data
        #
        # end
        #
        def myObject
              mmm ||= object

        end
        #
        def code
          1
          # er_code = {}
        end
        #
        # def success
        #   !anyErrors
        # end
      end
    end
  # end
