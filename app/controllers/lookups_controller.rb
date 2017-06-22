class LookupsController < ApplicationController
  def show
    @places = Place.all
  end

  def execute
    lookup   = GoogleGeoService.look_up_address(params[:query])
    response = if lookup
                 Place.create_from_lookup(lookup)
                 @places = Place.all
                 { partial: 'table_content', status: :created }
               else
                 { json: { error: t('error.address_not_found') }, status: :unprocessable_entity }
               end
    render response
  end
end
