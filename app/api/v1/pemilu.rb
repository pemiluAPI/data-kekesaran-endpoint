module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :data_kekerasan do
      desc "Return all Data Kekerasan"
      get do
        violences = Array.new

        valid_params = {
          event: 'event_record_number'
        }

        conditions = Hash.new
        valid_params.each_pair do |key, value|
          conditions[value.to_sym] = params[key.to_sym] unless params[key.to_sym].blank?
        end

        search = ["nama LIKE ?", params[:index]]

        violence =
          if params[:index]
            Violence.includes(:local_indices)
                .where(conditions)
                .where(search)
                .references(:local_indices)
          else
            Violence.includes(:local_indices)
                .where(conditions)
          end

        violence.each do |violence|
            violences << {
              id: violence.id,
              event_record_number: violence.event_record_number,
              event_title: violence.event_title,
              local_geographicaly_area: violence.geographic,
              initial_date: violence.initial_date,
              final_date: violence.final_date,
              local_index: violence.local_indices.select(:id, :nama)
            }
           end

        {
          results: {
            count: violences.count,
            data_kekerasan: violences
          }
        }
      end
    end

    resource :local_index do
      desc "Return all Local Index"
      get do
        indices = Array.new

        LocalIndex.group('name').count
          .each do |field|
            indices << {
              nama: field[0],
              data_kekerasan_count: field[1]
            }
          end

         {
          results: {
            count: indices.count,
            local_index: indices
          }
        }
      end
    end
  end
end