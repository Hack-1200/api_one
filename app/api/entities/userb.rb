
  module Entities
    class Userb < Grape::Entity
      root 'users', 'user'
        format_with(:iso_timestamp) { |dt| dt.iso8601 }
          expose :contact_info do
          expose :id
          expose :name
          expose :email
          expose :password
          expose :password_confirmation
          with_options(format_with: :iso_timestamp) do
            expose :created_at
            expose :updated_at
          end
        end

      end
    end
  # end
